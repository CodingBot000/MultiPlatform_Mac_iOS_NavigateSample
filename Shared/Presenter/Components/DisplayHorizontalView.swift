//
//  DisplayHorizontalView.swift
//  MultiPlaformMacOS_iOS
//
//  Created by switchMac on 11/21/24.
//

import SwiftUI

struct DisplayHorizontalView: View {
    let itemDatas: [DisplayData]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 0) {
                ForEach(0...itemDatas.count, id: \.self) { index in
                    let data = itemDatas[index]
                    DisplayHorizontalCell(
                        imageName: "",
                        name: data.name,
                        subName: data.name)
                }
            }.padding(.horizontal, 10)
        }
    }
}

private struct DisplayHorizontalCell: View {
    let imageName: String
    let name: String
    let subName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 100)
                .clipped()

            Text(name)
                .font(.headline)
            Text(subName)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 150)
    }
}


