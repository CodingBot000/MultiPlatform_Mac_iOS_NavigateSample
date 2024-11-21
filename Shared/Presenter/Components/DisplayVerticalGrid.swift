//
//  DisplayHorizontalView.swift
//  MultiPlaformMacOS_iOS
//
//  Created by switchMac on 11/21/24.
//

import SwiftUI

struct DisplayVerticalGrid: View {
    let itemDatas: [DisplayData]

    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let cellWidth = (geometry.size.width - 30) / 2
            let cellHeight = cellWidth * 0.8
            
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(0..<itemDatas.count, id: \.self) { index in
                        let data = itemDatas[index]
//                        Button(action: {
//                            onItemSelected(data) // 클릭 이벤트 발생 시 클로저 호출
//                        }) {
//                                                     NavigationLink(
//                                                         destination: ViewDetail(data: data),
//                                                         tag: data,
//                                                         selection: $selectedItem
//                                                     ) {
                        NavigationLink(value: data) {
                            DisplayHorizontalCell(
                                name: data.name,
                                color: data.color,
                                width: cellWidth,
                                height: cellHeight)
                                                     }
                        }
//                    }
                }
            }
//            .background(Color.green)
            .padding(.horizontal, 5)
        }.foregroundColor(.yellow)
    }
}



private struct DisplayHorizontalCell: View {
    let name: String
    let color: Color
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let cellWidth = geometry.size.width
            let cellHeight = cellWidth * 0.8

            Text(name)
                .font(.system(size: Dimens.fontSize))
                .foregroundColor(.white)
                .padding()
                .onAppear {
                    print("Rendering cell for name: \(name)")
                }
                .frame(width: width, height: height) // 너비와 높이 설정
                .background(color)
                .cornerRadius(12)
                .shadow(radius: 5)

        }
        .aspectRatio(1.0, contentMode: .fit)
    }
}
