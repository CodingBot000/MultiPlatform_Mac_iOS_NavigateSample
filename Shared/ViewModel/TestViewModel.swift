//
//  TestViewModel.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//


import Foundation
import Combine

class TestViewModel: ObservableObject {

    @Published var pathInfo: PathInfo?
    private var displayItemRepository = TestRepository.shared
    
    func getIdentifierString(identifier: Any)  {
   
        self.pathInfo =
        PathInfo(
            name: displayItemRepository.getIdentifierString(identifier: identifier),
            nextRoute: displayItemRepository.getNavNextPath(curIdentifier: identifier)
        )
    }
}
