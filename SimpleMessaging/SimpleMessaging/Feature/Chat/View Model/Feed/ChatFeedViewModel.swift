//
//  ChatFeedViewModel.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import CoreFoundational
import Foundation

final class ChatFeedViewModel {
    private (set) var title: String
    private (set) var chats: [Chat] = .init()
    private (set) var state: ChatFeedViewModelState = .error

    private (set) var service: ChatServiceable

    var onFeedStateChange: Observer<ChatFeedViewModelState>?

    init(
        title: String, 
        service: ChatServiceable
    ) {
        self.title = title
        self.service = service
    }
}

// MARK: - ChatFeedViewModelling
extension ChatFeedViewModel: ChatFeedViewModelling {
    func loadFeed() {
        updateState(toState: .loading)
    }
}

// MARK: - Update State
extension ChatFeedViewModel {
    private func updateState(toState updatedState: ChatFeedViewModelState) {
        DispatchQueue.main.async {
            self.state = updatedState
            self.onFeedStateChange?(updatedState)
        }
    }
}
