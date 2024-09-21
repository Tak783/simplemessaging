//
//  ChatFeedViewModel.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import Foundation
import CoreFoundational

protocol ChatFeedViewModelling {
    var title: String { get }
    var chats: [Chat] { get }
    var state: ChatFeedViewModelState { get }
    var service: ChatServiceable { get }
    
    var onFeedStateChange: Observer<ChatFeedViewModelState>? { get set}
}

enum ChatFeedViewModelState: Equatable {
    case loading
    case error
    case loaded([Chat])
}

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
        state = updatedState
    }
}
