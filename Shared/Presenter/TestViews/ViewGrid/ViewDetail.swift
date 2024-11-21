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
//        VStack {
//            Spacer()
//            
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
////            if let pathInfo = viewModel.pathInfo {
////                TestNameView(pathName: pathInfo.name)
//// 
////                Button("Goto \(pathInfo.nextRoute)") {
////                    withAnimation(.easeInOut) {
////                        path.appendRoute(pathInfo.nextRoute)
////                    }
////                }
////                
////            } else {
////                Text("Loading...")
////                    .font(.system(size: Dimens.fontSize))
////                    .padding()
////            }
//
//            Spacer()
//            
//        }
        ScrollView {
             VStack {
                 Text("\(data.name)\nRandom Generate UI")
                     .font(.largeTitle)
                     .padding()

                 // 랜덤 테트리스 블록 생성
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
//            viewModel.getMainNavigationNameString(navItem: navigationItem)
        }
    }
    
    // 랜덤 색상 생성
    private func randomColor() -> Color {
//        let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .cyan, .gray]
        return colorList.randomElement() ?? .black
    }

    // 블록 너비를 결정하는 랜덤 멀티플라이어
    private func randomMultiplier() -> CGFloat {
        [1.0, 1.5, 2.0].randomElement() ?? 1.0
    }
}


// 테트리스 블록 View
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

