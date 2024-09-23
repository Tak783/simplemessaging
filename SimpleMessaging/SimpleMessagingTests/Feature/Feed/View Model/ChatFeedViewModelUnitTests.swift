//
//  ChatFeedViewModelUnitTests.swift
//  SimpleMessagingTests
//
//  Created 21/09/2024.
//

@testable import SimpleMessaging
import XCTest

final class ChatFeedViewModelUnitTests: ChatFeedViewModelUnitTest {}

// MARK: - Test Init
extension ChatFeedViewModelUnitTests {
    func test_init_initialisesWithExpectedTitle() {
        let expectedTitle = "Simple Chat"
        let sut = makeSUT(title: expectedTitle)
        
        XCTAssertEqual(sut.title, expectedTitle)
    }
    
    func test_init_defaultInitialisesWithErrorState() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.state, ChatFeedViewModelState.error)
    }
    
    func test_init_defaultInitialisesWithEmptyChatPresentationModels() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.chatPresentationModels.count, .zero)
    }
}
    
// MARK: - Test Load Feed Init
extension ChatFeedViewModelUnitTests {
    func test_reloadFeed_setsViewModelStateToError() {
        let sut = makeSUT()
        
        sut.reloadFeed()
        
        XCTAssertEqual(sut.state, .error)
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

