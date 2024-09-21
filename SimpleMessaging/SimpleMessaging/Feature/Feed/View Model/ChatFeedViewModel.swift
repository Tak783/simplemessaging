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
    var service: ChatServiceable { get }
    
    var onFeedStateChange: Observer<ChatFeedViewModelState>? { get set}
}

enum ChatFeedViewModelState {
    case loading
    case error
    case loaded(Chat)
}

final class ChatFeedViewModel {
    var onFeedStateChange: Observer<ChatFeedViewModelState>?

    private (set) var title: String
    private (set) var service: ChatServiceable

    init(title: String, service: ChatServiceable) {
        self.title = title
        self.service = service
    }
}

// MARK: - ChatFeedViewModelling
extension ChatFeedViewModel: ChatFeedViewModelling {
    public func loadFeed() {
        
    }
}
