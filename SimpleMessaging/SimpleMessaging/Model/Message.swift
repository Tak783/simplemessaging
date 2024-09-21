//
//  Message.swift
//  SimpleMessaging
//
//  Created by Tak on 21/09/2024.
//

import Foundation

struct Message: Decodable, Identifiable {
    let id: String
    let text: String
    let lastUpdated: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case lastUpdated = "last_updated"
    }
}
