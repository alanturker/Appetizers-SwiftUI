//
//  CustomModifier.swift
//  Appetizers
//
//  Created by Turker Alan on 7.01.2025.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
    
}
