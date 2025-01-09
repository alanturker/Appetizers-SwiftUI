//
//  AccountView.swift
//  Appetizers
//
//  Created by Turker Alan on 23.12.2024.
//

import SwiftUI

struct AccountView: View {

    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    DatePicker("BirthDay", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $viewModel.user.isExtraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.isFrequentRefills)
                }
                .tint(.brandPrimary)
            }
            .navigationTitle("🫥 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss", role: .cancel) {
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.retrieveUser()
        })
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
    AccountView()
}
