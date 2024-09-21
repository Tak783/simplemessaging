//
//  ChatFeedViewModelling.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import Foundation

protocol ChatFeedViewModelling {
    var title: String { get }
    var chats: [Chat] { get }
    var state: ChatFeedViewModelState { get }
    var service: ChatServiceable { get }
    
    var onFeedStateChange: Observer<ChatFeedViewModelState>? { get set}
}
