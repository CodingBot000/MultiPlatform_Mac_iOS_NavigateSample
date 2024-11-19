//
//  AppTabNavigation.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/17/24.
//

import SwiftUI

struct AppTabNavigation: View {
    @State private var selection: NavigationItem = .menu
    @State private var pathMenu = NavigationPath()
   @State private var pathFavorites = NavigationPath()

   var body: some View {
       TabView(selection: $selection) {
           NavigationStack(path: $pathMenu) {
               View1(path: $pathMenu, navigationItem: NavigationItem.menu)
                   .navigationDestination(for: ViewIdentifier.self) { destination in
                       switch destination {
                       case .view1_1:
                           View1_1(path: $pathMenu)
                       case .view1_2:
                           View1_2(path: $pathMenu)
                       }
                   }
           }
           .tabItem {
               Label("Menu", systemImage: "list.bullet")
           }
           .tag(NavigationItem.menu)

           NavigationStack(path: $pathFavorites) {
               View2(path: $pathFavorites, navigationItem: NavigationItem.favorites)
                   .navigationDestination(for: ViewIdentifier2.self) { destination in
                       switch destination {
                       case .view2_1:
                           View2_1(path: $pathFavorites)
                       case .view2_2:
                           View2_2(path: $pathFavorites)
                       }
                   }
           }
           .tabItem {
               Label("Favorites", systemImage: "heart.fill")
           }
           .tag(NavigationItem.favorites)
       }
   }
}


// MARK: - Previews

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
