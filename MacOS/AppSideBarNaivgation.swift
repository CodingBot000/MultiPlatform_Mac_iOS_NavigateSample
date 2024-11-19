//
//  AppSideBarNaivgation.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/17/24.
//

import SwiftUI


struct AppSidebarNavigation: View {

    @State private var selection: NavigationItem? = .menu
    @State private var showDetailInView1 = false
    @State private var pathView1 = NavigationPath()
    @State private var pathView2 = NavigationPath()
    @State private var savedPathView1 = NavigationPath()
    @State private var savedPathView2 = NavigationPath()
    var body: some View {
        NavigationSplitView {
            sidebar
        } detail: {
            detailView
        }
    }


    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(value: NavigationItem.menu) {
                Label("Menu", systemImage: "list.bullet")
            }
            .tag(NavigationItem.menu)

            NavigationLink(value: NavigationItem.favorites) {
                Label("Favorites", systemImage: "heart")
            }
            .tag(NavigationItem.favorites)
        }
        .listStyle(SidebarListStyle())
        .onChange(of: selection) { oldValue, newValue in
            print("oldValue:\(oldValue)   newValue:\(newValue)")
            // Save the current path when switching away from menu
            switch oldValue {
            case .menu:
                savedPathView1 = pathView1
            case .favorites:
                savedPathView2 = pathView2
            case .none:
                print("oldValue:\(oldValue)")
            }
            
            switch newValue {
            case .menu:
                pathView1 = savedPathView1
            case .favorites:
                pathView2 = savedPathView2
            case .none:
                print("newValue:\(newValue)")
            }
        }
    }


    @ViewBuilder
    var detailView: some View {
        switch selection {
        case .menu:
            NavigationStack(path: $pathView1) {
               View1(path: $pathView1, navigationItem: NavigationItem.menu)
                    .navigationDestination(for: ViewIdentifier.self) { viewIdentifier in
                        
                        switch viewIdentifier {
                        case .view1_1:
                            View1_1(path: $pathView1)
                        case .view1_2:
                            View1_2(path: $pathView1)
                        }
                    }
           }
    
        case .favorites:
            NavigationStack(path: $pathView2) {
                View2(path: $pathView2, navigationItem: NavigationItem.favorites)
                    .navigationDestination(for: ViewIdentifier2.self) { viewIdentifier in
                        switch viewIdentifier {
                        case .view2_1:
                            View2_1(path: $pathView2)
                        case .view2_2:
                            View2_2(path: $pathView2)
                        }
                        
                    }
            }
        case nil:
            Text("Select a menu option")
                           .font(.largeTitle)
                           .foregroundColor(.gray)
        }
        
    }

}
