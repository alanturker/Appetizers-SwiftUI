//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Turker Alan on 3.01.2025.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 44, height: 44)
                .foregroundStyle(.white)
                .opacity(0.5)
            
            Image(systemName: "xmark")
                .tint(Color.brandPrimary)
                .imageScale(.medium)
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    XDismissButton()
}
