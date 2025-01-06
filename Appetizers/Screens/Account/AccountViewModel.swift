//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Turker Alan on 6.01.2025.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
            isShowingAlert = true
        } catch {
            alertItem = AlertContext.invalidUserData
            isShowingAlert = true
        }
    }
    
    func retrieveUser() {
        guard let userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
            isShowingAlert = true
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            isShowingAlert = true
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            isShowingAlert = true
            return false
        }
        
        isShowingAlert = false
        return true
    }
}
