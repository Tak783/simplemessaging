//
//  ChatDetailViewModel.swift
//  SimpleMessaging
//
//  Created on 23/09/2024.
//

import Foundation

protocol ChatDetailViewModelling {
    func sendMessage(withText messageText: String)
}

final class ChatMessagePresentationModel: Identifiable {
    private (set) var id: String
    private (set) var text: String
    private (set) var lastUpdated: String
    
    init(message: Message, dateFormatter: DateFormatter) {
        self.id = message.id
        self.text = message.text
        self.lastUpdated = dateFormatter.string(from: message.lastUpdated)
    }
}

final class ChatDetailViewModel: ObservableObject {
    @Published var messagePresentationModels: [ChatMessagePresentationModel]
    
    private var chat: Chat
    
    init(chat: Chat) {
        self.chat = chat
        self.messagePresentationModels =  Self.presentaionModels(chat.messages)
    }
}

// MARK: - ChatDetailViewModelling
extension ChatDetailViewModel: ChatDetailViewModelling {
    func sendMessage(withText messageText: String) {
        
    }
}
    
// MARK: - Helpers
extension ChatDetailViewModel {
    private static func presentaionModels(
        _ messages: [Message]
    ) -> [ChatMessagePresentationModel] {
        messages.map { message in
            ChatMessagePresentationModel(
                message: message,
                dateFormatter: .mediumUTCDateTimeFormatter
            )
        }.sorted {
            $0.lastUpdated < $1.lastUpdated
        }
    }
}
