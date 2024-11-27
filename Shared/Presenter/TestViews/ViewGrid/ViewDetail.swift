//
//  ViewDetail.swift
//  MultiPlaformMacOS_iOS
//
//  Created by switchMac on 11/20/24.
//


import SwiftUI

struct ViewDetail: View {
    let data: DisplayData

    
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
                         TetrisBlock(color: randomColor(), widthMultiplier: randomMultiplier())
                             .aspectRatio(1.0, contentMode: .fit)
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

        }
    }
    

    private func randomColor() -> Color {

        return colorList.randomElement() ?? .black
    }


    private func randomMultiplier() -> CGFloat {
        [1.0, 1.5, 2.0].randomElement() ?? 1.0
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

