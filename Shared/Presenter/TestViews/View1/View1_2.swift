//
//  View1_1.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/18/24.
//
import SwiftUI


struct View1_2: View {
    @Binding var path: NavigationPath
    @ObservedObject private var viewModel: TestViewModel = TestViewModel()
    
    private let curPath = ViewIdentifier.view1_2
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if let pathInfo = viewModel.pathInfo {
                TestNameView(pathName: pathInfo.name)
                
                Button("Fake Button For Matching Text pos") {
                 
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
        .background(Color.brown.ignoresSafeArea())
        .navigationTitle(viewModel.pathInfo?.name ?? "Loading...")
        .onAppear() {
            viewModel.getIdentifierString(identifier: curPath)
            withAnimation(.easeInOut) {}
        }
        
    }

}
