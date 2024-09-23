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
    private (set) var chatPresentationModels: [any ChatPresentationModelling] = .init()
    private (set) var state: ChatFeedViewModelState = .error

    private var chats: [Chat] = .init()
    private var service: ChatServiceable
    
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
    func reloadFeed() {
        Task {
            await loadFeed()
        }
    }

    func chat(atIndexPath indexPath: IndexPath) -> Chat? {
        guard chatPresentationModels.indices.contains(indexPath.row) else {
            return nil
        }
        let presentationModel = chatPresentationModels[indexPath.row]
        guard let index = chats.firstIndex(where: { $0.id == presentationModel.id }) else {
            return nil
        }
        return chats[index]
    }
}

// MARK: - Load Feed State Helpers
extension ChatFeedViewModel {
    private func loadFeed() async {
        updateState(toState: .loading)
        
        let result = await service.fetchData()
        switch result {
        case .success(let chats):
            didSuccesfullyLoadChats(withChats: chats)
        case .failure(let error):
            didFailToLoadChats(withError: error)
        }
    }
    
    private func didSuccesfullyLoadChats(withChats chats: [Chat]) {
        let dateFormatter = DateFormatter.dayDateTimeCurrentLocaleDateFormatter
        DispatchQueue.performOnMainThread {
            self.chats = chats.sorted { $0.lastUpdated > $1.lastUpdated }
            self.chatPresentationModels = self.chats.map { chat in
                ChatPresentationModel(chat: chat, dateFormatter: dateFormatter)
            }
            self.updateState(toState: .loaded)
        }
    }
    
    private func didFailToLoadChats(withError error: Error) {
        DispatchQueue.performOnMainThread {
            efficientPrint(error.localizedDescription)
            self.updateState(toState: .error)
        }
    }
}

// MARK: - Update State Helpers
extension ChatFeedViewModel {
    private func updateState(toState updatedState: ChatFeedViewModelState) {
        DispatchQueue.main.async {
            self.state = updatedState
            self.onFeedStateChange?(updatedState)
        }
    }
}
