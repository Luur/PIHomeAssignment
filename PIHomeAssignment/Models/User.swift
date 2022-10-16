//
//  User.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import Foundation

struct User {
    
    let name: String
    let avatar: String
    let balance: Double
    
    var avatarURL: URL? {
        URL(string: avatar)
    }
    
    var formattedBalance: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: balance))!
    }
    
    static let current = User(name: "Matthew", avatar: "https://thispersondoesnotexist.com/image", balance: 246.0)
}
