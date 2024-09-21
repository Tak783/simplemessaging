//
//  SpyChatFeed.swift
//  SimpleMessagingTests
//
//  Created on 21/09/2024.
//

import Foundation
@testable import SimpleMessaging

final class SpyChatFeed: NSObject {
    var state = ChatFeedViewModelState.error
    
    var viewModel: ChatFeedViewModel

    init(viewModel: ChatFeedViewModel) {
        self.viewModel = viewModel
        super.init()

        bind()
    }

    func bind() {
        viewModel.onFeedStateChange = { [weak self] state in
            guard let self = self else { return }
            self.state = state
        }
    }
}

