//
//  DisplayItemsViewModel.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//


import Foundation
import Combine

class DisplayItemsViewModel: ObservableObject {
    @Published var displayItemDatas: [[DisplayData]]?
    @Published var displayItemMergeDatas: [DisplayData]?
    private var displayItemRepository = DisplayItemRepository.shared
    
    func getDisplayItemDatas() {
        let listInLists: [[DisplayData]] = displayItemRepository.getDisplayDatasList()
        self.displayItemDatas = listInLists
    }
    
    func getDisplayItemsMergeDatas() {
        let mergeList: [DisplayData] = displayItemRepository.getDisplayDatasMergeList()
        self.displayItemMergeDatas = mergeList
    }
}
