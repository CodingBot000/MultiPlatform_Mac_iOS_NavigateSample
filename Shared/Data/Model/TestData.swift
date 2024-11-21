//
//  TestData.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//

//struct TestData {
//    let name: String
//}

import SwiftUICore

struct PathInfo: Hashable, Equatable {
    let name: String
    var nextRoute: AnyHashable
}


struct DisplayData: Hashable, Equatable, Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let color: Color
}
