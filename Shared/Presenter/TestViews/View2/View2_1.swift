//
//  View1_1.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/18/24.
//
import SwiftUI

struct View2_1: View {
    @Binding var path: NavigationPath
    @ObservedObject private var viewModel: TestViewModel = TestViewModel()
    
    private let curPath = ViewIdentifier2.view2_1

    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if let pathInfo = viewModel.pathInfo {
                TestNameView(pathName: pathInfo.name)
                
                Button("Show \(pathInfo.nextRoute)") {
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
        .background(Color.gray.ignoresSafeArea())

        .navigationTitle(viewModel.pathInfo?.name ?? "Loading...")
        .onAppear {
            viewModel.getIdentifierString(identifier: curPath)
            // back animation
            withAnimation(.easeInOut) {}
        }
    }
}
