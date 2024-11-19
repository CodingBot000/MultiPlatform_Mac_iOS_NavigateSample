//
//  TestNameView.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//

import SwiftUI

struct TestNameView: View {
    var pathName: String
    
    var body: some View {
        VStack {
            #if os(macOS)
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("\(pathName)\nMacOS")
                    .font(.system(size: Dimens.fontSize))
                    .padding()
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            #else
            Text("\(pathName)\niOS")
                .font(.system(size: Dimens.fontSize))
                .padding()
            #endif
        }
    }
}
