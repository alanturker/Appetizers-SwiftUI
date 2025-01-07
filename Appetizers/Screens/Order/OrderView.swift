//
//  OrderView.swift
//  Appetizers
//
//  Created by Turker Alan on 23.12.2024.
//

import SwiftUI

struct OrderView: View {
    @State var orderItems = MockData.orderedItemsArray
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print(  "order")
                    } label: {
                        APButton(price: 9.99)
                    }
                    .padding(.bottom, 30)
                }
                
                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            
            
            .navigationTitle("🧾 Orders")
            
        }
        
    }
    
    func deleteItems(at offSets: IndexSet) {
        orderItems.remove(atOffsets: offSets)
    }
}

#Preview {
    OrderView()
}
