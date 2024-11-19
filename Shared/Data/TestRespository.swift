//
//  TestRespository.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//

class TestRepository {
    static let shared = TestRepository()
    
    private init() {}
    

    func getIdentifierString(identifier: Any) -> String {
        switch identifier {
        case ViewIdentifier.view1_1:
            return "View 1-1"
        case ViewIdentifier.view1_2:
            return "View 1-2"
        case ViewIdentifier2.view2_1:
            return "View 2-1"
        case ViewIdentifier2.view2_2:
            return "View 2-2"
        default:
            return "Unknown Identifier"
        }
    }

    
    func getNavNextPath(curIdentifier: Any) -> AnyHashable {
        switch curIdentifier {
        case ViewIdentifier.view1_1:
            return ViewIdentifier.view1_2
        case ViewIdentifier2.view2_1:
            return ViewIdentifier2.view2_2
        default:
            return ViewIdentifierNothing.nothing
        }
    }
}
