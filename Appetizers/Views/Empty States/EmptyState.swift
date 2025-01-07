//
//  OrderEmptyStateView.swift
//  Appetizers
//
//  Created by Turker Alan on 7.01.2025.
//

import SwiftUI

struct EmptyState: View {
    var imageName: String
    var message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -30)
            .padding()
        }
        
        
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "Test message, im making it a little longer for testing purposes")
}
