//
//  Appetizer.swift
//  Appetizers
//
//  Created by Turker Alan on 23.12.2024.
//

import Foundation

struct Appetizer: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 001,
                                           name: "Test Appetizer",
                                           description: "This is the test description",
                                           price: 8.59,
                                           imageURL: "",
                                           calories: 24,
                                           protein: 36,
                                           carbs: 49)
    
    static let appitezers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
