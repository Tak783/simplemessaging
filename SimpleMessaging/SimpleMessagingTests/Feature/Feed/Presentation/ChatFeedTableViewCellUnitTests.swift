//
//  ChatFeedTableViewCellUnitTests.swift
//  SimpleMessagingTests
//
//  Created by  on 23/09/2024.
//

import Foundation
import XCTest
@testable import SimpleMessaging

final class ChatFeedTableViewCellUnitTests: XCTest {}

// MARK: - Test Static Helpers
extension ChatFeedTableViewCellUnitTests {
    func test_reuseIdentifier_isClassName() {
        let sut = ChatFeedTableViewCell.reuseIdentifier
        XCTAssertEqual(sut, "ChatFeedTableViewCell")
    }
}

// MARK: - Test Init
extension ChatFeedTableViewCellUnitTests {
    func test_init_loadsExpectedViews() {
        let sut = makeSUT()
        
        XCTAssertNotNil((sut.dslTitleLabel as? UILabel)?.text)
        XCTAssertNotNil((sut.dslDetailLabel as? UILabel)?.text)
    }
}

// MARK: - Test Update
extension ChatFeedTableViewCellUnitTests {
    func test_update_updatesTitleLabel() {
        let stubbedChat = ChatStub.stubbedChatOne()
        let presentationModel = ChatPresentationModel(
            chat: stubbedChat,
            dateFormatter: .mediumCurrentLocaleDateTimeFormatter
        )
        
        let sut = makeSUT()
        
        sut.update(withPresentationModel: presentationModel)
        
        XCTAssertEqual((sut.dslTitleLabel as? UILabel)?.text, presentationModel.name)
    }
    
    func test_update_updatesDetailLabel() {
        let stubbedChat = ChatStub.stubbedChatOne()
        let presentationModel = ChatPresentationModel(
            chat: stubbedChat,
            dateFormatter: .mediumCurrentLocaleDateTimeFormatter
        )
        
        let sut = makeSUT()
        
        sut.update(withPresentationModel: presentationModel)
        
        XCTAssertEqual((sut.dslDetailLabel as? UILabel)?.text, presentationModel.lastUpdated)
    }
}

// MARK: - Make SUT
extension ChatFeedTableViewCellUnitTests {
    private func makeSUT() -> ChatFeedTableViewCell {
        return ChatFeedTableViewCell()
    }
}

