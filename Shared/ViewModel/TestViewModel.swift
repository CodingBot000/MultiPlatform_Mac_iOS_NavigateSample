//
//  TestViewModel.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//


import Foundation
import Combine

class TestViewModel: ObservableObject {
    @Published var testData: TestData?
    @Published var pathInfo: PathInfo?
    private var displayItemRepository = TestRepository.shared
    
    func getIdentifierString(identifier: Any)  {
        self.testData =
        TestData(
            name: displayItemRepository.getIdentifierString(identifier: identifier)
        )
        
        self.pathInfo =
        PathInfo(
            name: displayItemRepository.getIdentifierString(identifier: identifier),
            nextRoute: displayItemRepository.getNavNextPath(curIdentifier: identifier)
        )
    }
}
