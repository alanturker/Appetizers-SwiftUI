//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Turker Alan on 23.12.2024.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack {
            List(MockData.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍔 Appetizers")
            
        }
        
    }
}

#Preview {
    AppetizerListView()
}
