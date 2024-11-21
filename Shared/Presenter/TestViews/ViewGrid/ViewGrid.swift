//
//  ViewGrid.swift
//  MultiPlaformMacOS_iOS
//
//  Created by switchMac on 11/20/24.
//


import SwiftUI

struct ViewGrid: View {
    @Binding var path: NavigationPath
    var navigationItem: NavigationItem
    
    @ObservedObject private var viewModel: DisplayItemsViewModel = DisplayItemsViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
#if os(iOS)
            if let displayInfos = viewModel.displayItemMergeDatas {
                DisplaySectioniOSView(displayDataList: displayInfos,
                                      title: "Display")
                
            } else {
                Text("Loading...")
                    .font(.system(size: Dimens.fontSize))
                    .padding()
            }
#else
            if let displayInfos = viewModel.displayItemDatas {
                DisplaySectionMacOSView(displayDataList: displayInfos,
                                        title: "Display")
                
            } else {
                Text("Loading...")
                    .font(.system(size: Dimens.fontSize))
                    .padding()
            }
#endif
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color.white.ignoresSafeArea())
        .onAppear() {
            #if os(iOS)
            viewModel.getDisplayItemsMergeDatas()
            #else
            viewModel.getDisplayItemDatas()
            #endif
        }
    }
}
