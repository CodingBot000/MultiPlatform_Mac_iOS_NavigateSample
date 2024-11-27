//
//  ViewDetail.swift
//  MultiPlaformMacOS_iOS
//
//  Created by switchMac on 11/20/24.
//


import SwiftUI

struct ViewDetail: View {
    let data: DisplayData
    
    @State private var scaleFactors: [CGFloat] = Array(repeating: 1.0, count: 80)
    
    
    var body: some View {

        ScrollView {
             VStack {
                 Text("\(data.name)\nRandom Generate UI")
                     .font(.largeTitle)
                     .padding()

                 LazyVGrid(
                     columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 5),
                     spacing: 5
                 ) {
                     ForEach(0..<80, id: \.self) { index in
                         TetrisBlock(color: randomColor(), widthMultiplier: randomMultiplier() * scaleFactors[index])
                                  .aspectRatio(1.0, contentMode: .fit)
                                  .animation(.easeInOut(duration: randomAnimationDuration()), value: scaleFactors[index])
                     }
                 }
                 .padding()
             }
         }
         .navigationTitle("Detail View")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(data.color.ignoresSafeArea())
        .navigationTitle("ViewDetail")
        .onAppear() {
            startRandomScaleAnimation()
        }
    }
    

    private func randomColor() -> Color {
        return colorList.randomElement() ?? .black
    }


    private func randomMultiplier() -> CGFloat {
        [1.0, 1.5, 2.0].randomElement() ?? 1.0
    }
    
    private func randomAnimationDuration() -> Double {
            return Double.random(in: 0.5...2.0)
        }
        
        private func startRandomScaleAnimation() {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                var newScaleFactors = scaleFactors
                let countToAnimate = Int(Double(scaleFactors.count) * (1.0 / 3.0))
                let indicesToAnimate = (0..<scaleFactors.count).shuffled().prefix(countToAnimate)

                for index in indicesToAnimate {
                    newScaleFactors[index] = CGFloat.random(in: 0.5...2.0)
                }

                withAnimation {
                    scaleFactors = newScaleFactors
                }
            }
        }
}


struct TetrisBlock: View {
    let color: Color
    let widthMultiplier: CGFloat

    var body: some View {
        GeometryReader { geometry in
            let blockWidth = geometry.size.width * widthMultiplier
            RoundedRectangle(cornerRadius: 5)
                .fill(color)
                .frame(width: blockWidth, height: blockWidth)
        }
    }
}

