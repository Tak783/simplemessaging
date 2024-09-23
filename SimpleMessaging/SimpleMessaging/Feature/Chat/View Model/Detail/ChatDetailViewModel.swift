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
    @Published var title: String
    
    private var chat: Chat
    
    init(chat: Chat) {
        self.chat = chat
        self.title = chat.name
        self.messagePresentationModels = Self.presentaionModels(chat.messages)
    }
}

// MARK: - ChatDetailViewModelling
extension ChatDetailViewModel: ChatDetailViewModelling {
    func sendMessage(withText messageText: String) {
        let message = Message(
            id: UUID().uuidString,
            text: messageText,
            lastUpdated: .now
        )
        chat.messages.append(message)
        messagePresentationModels = Self.presentaionModels(
            chat.messages
        )
    }
}
    
// MARK: - Helpers
extension ChatDetailViewModel {
    private static func presentaionModels(
        _ messages: [Message]
    ) -> [ChatMessagePresentationModel] {
        let sortedMessages = messages.sorted {
            $0.lastUpdated < $1.lastUpdated
        }
        return sortedMessages.map { message in
            ChatMessagePresentationModel(
                message: message,
                dateFormatter: .mediumUTCDateTimeFormatter
            )
        }
    }
}
