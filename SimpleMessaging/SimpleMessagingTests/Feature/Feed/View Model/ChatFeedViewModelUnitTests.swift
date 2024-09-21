//
//  ChatFeedViewModelUnitTests.swift
//  SimpleMessagingTests
//
//  Created 21/09/2024.
//

@testable import SimpleMessaging
import XCTest

protocol ChatFeedViewModelUnitTestsSpec {
    func test_init_initialisesWithExpectedTitle()
    func test_init_defaultInitialisesWithLoadedState()
    func test_init_defaultInitialisesWithEmptyChatFeedModel()
    
    func test_loadFeed_setsViewModelStateToLoading()
}

typealias ChatFeedViewModelUnitTest = XCTestCase & ChatFeedViewModelUnitTestsSpec

final class ChatFeedViewModelUnitTests: ChatFeedViewModelUnitTest {}

// MARK: - Test Init
extension ChatFeedViewModelUnitTests {
    func test_init_initialisesWithExpectedTitle() {
        let expectedTitle = "Simple Chat"
        let sut = makeSUT(title: expectedTitle)
        
        XCTAssertEqual(sut.title, expectedTitle)
    }
    
    func test_init_defaultInitialisesWithLoadedState() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.state, .loaded)
    }
    
    func test_init_defaultInitialisesWithEmptyChatFeedModel() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.chats, .init())
    }
}
    
// MARK: - Test Load Feed Init
extension ChatFeedViewModelUnitTests {
    func test_loadFeed_setsViewModelStateToLoading() {
        let sut = makeSUT()
        
        sut.loadFeed()
        
        XCTAssertEqual(sut.state, .loading)
    }
}
 
// MARK: - Make System Under Test
extension ChatFeedViewModelUnitTests {
    func makeSUT(
        title: String = "Chats",
        service: ChatServiceable = StubChatService()
    ) -> ChatFeedViewModel {
        return ChatFeedViewModel(title: title, service: service)
    }
}

