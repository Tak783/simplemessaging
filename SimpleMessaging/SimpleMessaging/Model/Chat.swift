//
//  Feed.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import Foundation

struct Chat: Decodable, Identifiable {
    let id: String
    let name: String
    let lastUpdated: Date
    let messages: [Message]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case lastUpdated = "last_updated"
        case messages
    }
}

// MARK: - Equatable
extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        lhs.id == rhs.id
    }
}
