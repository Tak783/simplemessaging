//
//  ChatFeedViewModelUnitTests.swift
//  SimpleMessagingTests
//
//  Created 21/09/2024.
//

import Foundation
@testable import SimpleMessaging

protocol ChatFeedViewModelUnitTestsSpec {
    func test_init_defaultInitialisesWithExpectedTitle()
    func test_init_defaultInitialisesWithLoadedStateWithEmptyChatFeed()
    func test_init_defaultInitialisesWithEmptyChatFeedModel()
    
    func test_loadFeed_setsViewModelStateToLoading()
}
