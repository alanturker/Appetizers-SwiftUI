//
//  APButton.swift
//  Appetizers
//
//  Created by Turker Alan on 3.01.2025.
//

import SwiftUI

struct APButton: View {
    var price: Double
    
    var body: some View {
        Text("$\(String(format: "%.2f", price)) - Add to Order")
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(Color.white)
            .background(Color.brandPrimary)
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    APButton(price: 9.99)
}
