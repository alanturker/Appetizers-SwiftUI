//
//  User.swift
//  Appetizers
//
//  Created by Turker Alan on 6.01.2025.
//

import Foundation

struct User: Codable {
    var firstName: String       = ""
    var lastName: String        = ""
    var email: String           = ""
    var birthdate: Date         = Date()
    var isExtraNapkins: Bool    = false
    var isFrequentRefills: Bool = false
}
