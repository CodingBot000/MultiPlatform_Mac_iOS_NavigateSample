//
//  DisplayItemRepository.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//

import Foundation

class DisplayItemRepository {
    static let shared = DisplayItemRepository()
    
    private init() {}
    
    private var displayListContainer: [[DisplayData]] = []
    private var displayMergeListContainer: [DisplayData] = []
    
    func getDisplayDatasList() -> [[DisplayData]] {
        if !displayListContainer.isEmpty {
            return displayListContainer
        }
        
//        let dataList = initDataList().shuffled()
        let dataList = initDataList()
        
        displayListContainer = [
            Array(dataList.prefix(25)),
            Array(dataList.dropFirst(25).prefix(25)),
            Array(dataList.dropFirst(50).prefix(25)),
            Array(dataList.dropFirst(75).prefix(25))
        ]
        
        return displayListContainer
    }
    
    func getDisplayDatasMergeList() -> [DisplayData] {
        if !displayMergeListContainer.isEmpty {
            return displayMergeListContainer
        }
        
        let dataList = initDataList()
        
        displayMergeListContainer = dataList.compactMap { $0 }
        
        return displayMergeListContainer
    }
  
    private func initDataList() -> [DisplayData] {
        var dataList: [DisplayData] = []
        for i in 0...100 {
            let color = colorList[i % colorList.count]
            dataList.append(DisplayData(name: String(i), color: color))
        }
        return dataList
    }
}
