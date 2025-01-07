//
//  Order.swift
//  Appetizers
//
//  Created by Turker Alan on 7.01.2025.
//

import Foundation

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { partialResult, appetizer in
            partialResult + appetizer.price
        }
    }
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offSets: IndexSet) {
        items.remove(atOffsets: offSets)
    }
}
