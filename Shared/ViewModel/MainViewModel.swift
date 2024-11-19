//
//  MainViewModel.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//


import Foundation
import Combine

class MainViewModel: ObservableObject {
    @Published var pathInfo: PathInfo?
    private var displayItemRepository = MainRespository.shared
    
    func getMainNavigationNameString(navItem: NavigationItem)  {
        self.pathInfo =
        PathInfo(
            name: displayItemRepository.getMainNavigationNameString(navItem: navItem),
            nextRoute: displayItemRepository.getNavNextPath(navItem: navItem)
        )
    }
}
