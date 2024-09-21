//
//  ChatFeedViewModelUnitTests.swift
//  SimpleMessagingTests
//
//  Created 21/09/2024.
//

@testable import SimpleMessaging
import XCTest

protocol ChatFeedViewModelUnitTestsSpec {
    func test_init_defaultInitialisesWithExpectedTitle()
    func test_init_defaultInitialisesWithLoadedStateWithEmptyChatFeed()
    func test_init_defaultInitialisesWithEmptyChatFeedModel()
    
    func test_loadFeed_setsViewModelStateToLoading()
}

typealias ChatFeedViewModelUnitTest = XCTestCase & ChatFeedViewModelUnitTestsSpec

final class MovieCarouselViewModelUnitTests: ChatFeedViewModelUnitTest {
    func test_init_defaultInitialisesWithExpectedTitle() {
        
    }
    
    func test_init_defaultInitialisesWithLoadedStateWithEmptyChatFeed() {
        
    }
    
    func test_init_defaultInitialisesWithEmptyChatFeedModel() {
        
    }
    
    func test_loadFeed_setsViewModelStateToLoading() {
        
    }
}
