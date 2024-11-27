//
//  DisplaySectionView.swift
//  Shopping
//
//  Created by switchMac on 8/22/24.
//

import SwiftUI


struct DisplaySectionMacOSView: View {
    var displayDataList: [[DisplayData]]
    var title: String

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text(title)
                        .font(.system(size: Dimens.fontSize))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    ForEach(0..<displayDataList.count, id:\.self) { index in
                        PaginatedGridView(
                            itemDatas: displayDataList[index]
                        )
                    }
                }
            }
        }

    }
    
}

struct DisplaySectioniOSView: View {
    var displayDataList: [DisplayData]
    var title: String


    var body: some View {
        NavigationStack {
            VStack {
                Text(title)
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                

                DisplayVerticalGrid(
                    itemDatas: displayDataList
          
                )
                
            }
            .navigationDestination(for: DisplayData.self) { data in
                ViewDetail(data: data)
            }
        }

    }
    
}


