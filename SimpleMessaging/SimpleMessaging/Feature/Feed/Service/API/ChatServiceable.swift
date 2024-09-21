//
//  ChatServiceable.swift
//  SimpleMessaging
//
//  Created by Tak on 21/09/2024.
//

import Foundation

protocol ChatServiceable {
    func fetchChats() async throws -> [Chat]
}
