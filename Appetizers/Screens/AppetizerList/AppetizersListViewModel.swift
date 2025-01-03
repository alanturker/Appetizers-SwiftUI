//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Turker Alan on 24.12.2024.
//

import SwiftUI

final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    @Published var isLoading = false
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let appetizers):
                    self?.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self?.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self?.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self?.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self?.alertItem = AlertContext.unableToComplete

                    }
                    self?.isShowingAlert = true
                }
            }
        }
    }
}
