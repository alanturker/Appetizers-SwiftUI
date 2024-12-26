//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Turker Alan on 23.12.2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizersListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍔 Appetizers")
            
        }
        .onAppear {
            viewModel.getAppetizers()
        }
        .alert(viewModel.alertItem?.title ?? "", isPresented: $viewModel.isShowingAlert) {
            Button("Ok") {
                viewModel.isShowingAlert = false
            }
        } message: {
            viewModel.alertItem?.message
        }
        
    }
}

#Preview {
    AppetizerListView()
}
