//
//  View2_2.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/18/24.
//
import SwiftUI


struct View2_2: View {
    @Binding var path: NavigationPath
    @ObservedObject private var viewModel: TestViewModel = TestViewModel()
    
    private let curPath = ViewIdentifier2.view2_2
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if let pathInfo = viewModel.pathInfo {
                TestNameView(pathName: pathInfo.name)
                
                Button("Matching Text pos") {
                 
                }.hidden()
            } else {
                Text("Loading...")
                    .font(.system(size: Dimens.fontSize))
                    .padding()
            }


            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color.cyan.ignoresSafeArea())
        .navigationTitle(viewModel.pathInfo?.name ?? "Loading...")
        .onAppear {
            viewModel.getIdentifierString(identifier: curPath)
            // back animation
            withAnimation(.easeInOut) {}
        }

    }
}
