//
//  ContentView.swift
//  MultiPlaformMacOS_iOS
//
//  Created by switchMac on 11/19/24.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    var body: some View {

      #if os(iOS)
      if horizontalSizeClass == .compact {
          AppTabNavigation().accentColor(.green)

      } else {

          AppSidebarNavigation().accentColor(.green)
      }
      #else
      AppSidebarNavigation().accentColor(.green)
      #endif
    }
}

#Preview {
    ContentView()
}
