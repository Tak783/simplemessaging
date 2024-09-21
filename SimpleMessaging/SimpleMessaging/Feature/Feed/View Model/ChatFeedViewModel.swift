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

enum ChatFeedViewModelState {
    case loading
    case error
    case loaded
}

final class ChatFeedViewModel {
    private (set) var title: String
    private (set) var chats: [Chat]
    private (set) var state: ChatFeedViewModelState

    private (set) var service: ChatServiceable

    var onFeedStateChange: Observer<ChatFeedViewModelState>?

    init(
        title: String, 
        service: ChatServiceable,
        chats: [Chat] = [],
        state: ChatFeedViewModelState = .loaded
    ) {
        self.title = title
        self.service = service
        self.chats = chats
        self.state = state
    }
}

// MARK: - ChatFeedViewModelling
extension ChatFeedViewModel: ChatFeedViewModelling {
    func loadFeed() {
        
    }
}
