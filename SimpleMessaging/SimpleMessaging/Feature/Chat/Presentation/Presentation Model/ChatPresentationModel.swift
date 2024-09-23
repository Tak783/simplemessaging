//
//  ChatPresentationModel.swift
//  SimpleMessaging
//
//  Created on 23/09/2024.
//

import Foundation

final class ChatPresentationModel {
    private (set) var id: String
    private (set) var name: String
    private (set) var lastUpdated: String
    
    init(chat: Chat, dateFormatter: DateFormatter) {
        self.id = chat.id
        self.name = chat.name
        self.lastUpdated = dateFormatter.string(from: chat.lastUpdated)
    }
}

// MARK: - ChatPresentationModelling
extension ChatPresentationModel: ChatPresentationModelling {
    static func == (lhs: ChatPresentationModel, rhs: ChatPresentationModel) -> Bool {
        lhs.id == rhs.id
    }
}
