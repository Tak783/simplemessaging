//
//  Message.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import Foundation

struct Message: Codable, Identifiable {
    let id: String
    let text: String
    let lastUpdated: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case lastUpdated = "last_updated"
    }
}
