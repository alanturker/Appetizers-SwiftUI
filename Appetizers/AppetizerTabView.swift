//
//  ContentView.swift
//  Appetizers
//
//  Created by Turker Alan on 23.12.2024.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                AppetizerListView()
            }
            Tab("Account", systemImage: "person") {
                AccountView()
            }
            Tab("Order", systemImage: "bag") {
                OrderView()
            }
            .badge(1)
        }
        .tint(Color.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
