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
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
//                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.isShowingDetailView = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetailView)
                .navigationTitle("🍔 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            if viewModel.isShowingDetailView {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetailView: $viewModel.isShowingDetailView)
                    .shadow(radius: 40)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
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
