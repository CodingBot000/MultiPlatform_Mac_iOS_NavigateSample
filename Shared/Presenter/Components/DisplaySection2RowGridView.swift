//
//  DisplaySection2RowGridView.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/18/24.
//

import SwiftUI


struct PaginatedGridView: View {
    let itemDatas: [DisplayData]

    private let contentsWidth: CGFloat = Dimens.macWidth - Dimens.macSidbarWidth
    private let gridHeight: CGFloat = 150
  
    @State private var currentPage: Int = 0
    @State private var offset: CGFloat = 0
    @State private var selectedItem: DisplayData? = nil

    private let itemsPerPage = 6 // 2 * 3
    
    var totalPages: Int {
        (itemDatas.count + itemsPerPage - 1) / itemsPerPage
    }
    
    var body: some View {

        VStack {
            ZStack {
                ForEach(0..<totalPages, id: \.self) { page in
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3),
                        spacing: 10
                    ) {
                        ForEach(currentItems(for: page), id: \.self) { item in
                            if item.name.isEmpty {
                                emptyCellView()
                            } else {
                                NavigationLink(destination: ViewDetail(data: item)) {
                                    gridItemView(item: item)
                                }
                                .buttonStyle(PlainButtonStyle())


                            }
                        }
                    }
                    .frame(width: contentsWidth, height: gridHeight * 2 + 70)
                    .offset(x: offsetForPage(page))
                    .animation(.easeInOut, value: offset)
                }
                
                SideNavigationButtons(
                    currentPage: currentPage,
                    totalPages: totalPages,
                    onPrevious: { moveToPage(currentPage - 1) },
                    onNext: { moveToPage(currentPage + 1) }
                )
            }
            .clipped()

        }.foregroundColor(.white)

    }
    
     private func gridItemView(item: DisplayData) -> some View {
         VStack {

             Text(item.name)
                 .font(.system(size: 40))
                 .multilineTextAlignment(.center)
                 .foregroundColor(.black)
         
         }
         .frame(width: (contentsWidth - 40) / 3, height: gridHeight)
         .background(item.color)
         .cornerRadius(12)
         .shadow(radius: 5)
     }

     private func emptyCellView() -> some View {
         VStack {
             Rectangle()
                 .fill(Color.clear)
                 .frame(width: (contentsWidth - 40) / 3, height: gridHeight)
         }
     }

    private func currentItems(for page: Int) -> [DisplayData] {
        let startIndex = page * itemsPerPage
        let endIndex = min(startIndex + itemsPerPage, itemDatas.count)
        var items = Array(itemDatas[startIndex..<endIndex])
        
  
        let missingCount = itemsPerPage - items.count
        if missingCount > 0 {
            items.append(contentsOf: Array(repeating: DisplayData(name: "", color: Color.clear), count: missingCount))
        }

        return items
    }
    
    private func offsetForPage(_ page: Int) -> CGFloat {
        (CGFloat(page) - CGFloat(currentPage)) * contentsWidth
    }
    
    private func moveToPage(_ page: Int) {
        guard page >= 0 && page < totalPages else { return }
        currentPage = page
        offset = CGFloat(-currentPage) * contentsWidth
    }
}

private struct SideNavigationButtons: View {
    let currentPage: Int
    let totalPages: Int
    let onPrevious: () -> Void
    let onNext: () -> Void
    
    var body: some View {
        HStack {
            if currentPage > 0 {
                Button(action: {
                    withAnimation {
                        onPrevious()
                    }
                }) {
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }.buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
            
            if currentPage < totalPages - 1 {
                Button(action: {
                    withAnimation {
                        onNext()
                    }
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }.buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal, 20)
    }
}
