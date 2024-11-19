//
//  MainRespository.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//

class MainRespository {
    static let shared = MainRespository()
    
    private init() {}
    

    func getMainNavigationNameString(navItem: NavigationItem) -> String {
        switch navItem {
        case NavigationItem.menu:
            return "View1 Menu"
        case NavigationItem.favorites:
            return "View2 Favorites"
        }
    }
    
    func getNavNextPath(navItem: NavigationItem) -> AnyHashable {
        switch navItem {
        case NavigationItem.menu:
            return ViewIdentifier.view1_1
        case NavigationItem.favorites:
            return ViewIdentifier2.view2_1
        }
    }
    
    

}
