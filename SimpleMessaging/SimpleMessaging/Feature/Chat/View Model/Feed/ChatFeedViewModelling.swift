//
//  ChatFeedViewModelling.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import Foundation
import CoreFoundational

protocol ChatFeedViewModelling {
    var title: String { get }
    var chatPresentationModels: [any ChatPresentationModelling] { get }
    var state: ChatFeedViewModelState { get }
    
    var onFeedStateChange: Observer<ChatFeedViewModelState>? { get set}
    
    func reloadFeed()
    func chat(atIndexPath indexPath: IndexPath) -> Chat?
}
