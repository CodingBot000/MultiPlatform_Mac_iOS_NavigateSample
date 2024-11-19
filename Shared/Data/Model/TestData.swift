//
//  TestData.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//

struct TestData {
    let name: String
}


struct PathInfo: Hashable, Equatable {
    let name: String
    var nextRoute: AnyHashable
}
