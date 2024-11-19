//
//  Viiew1.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/17/24.
//

import SwiftUI

struct View2: View {
    @Binding var path: NavigationPath
    var navigationItem: NavigationItem
    
    @ObservedObject private var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if let pathInfo = viewModel.pathInfo {
                TestNameView(pathName: pathInfo.name)

                Button("Goto \(pathInfo.nextRoute)") {
                    withAnimation(.easeInOut) {
                        path.appendRoute(pathInfo.nextRoute)
                    }
                }
                
            } else {
                Text("Loading...")
                    .font(.system(size: Dimens.fontSize))
                    .padding()
            }

            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color.teal.ignoresSafeArea())
        .navigationTitle(viewModel.pathInfo?.name ?? "Loading...")
        .onAppear() {
            viewModel.getMainNavigationNameString(navItem: NavigationItem.favorites)
        }
        
    }
}
