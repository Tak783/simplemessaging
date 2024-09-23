//
//  Chat+UnitTests.swift
//  SimpleMessagingTests
//
//  Created by  on 21/09/2024.
//

import Foundation
import XCTest

final class ChatUnitTests: XCTest {
    func test_equatable_retunsTrueIfIDsAreTheSame() {
        let chatOne = ChatStub.stubbedChatOne()
        let chatTwo = ChatStub.stubbedChatOne()
    
        XCTAssertEqual(chatOne == chatTwo, true)
    }
    
    func test_equatable_retunsFalseIfIDsAreNotTheSame() {
        let chatOne = ChatStub.stubbedChatOne()
        let chatTwo = ChatStub.stubbedChatTwo()
    
        XCTAssertEqual(chatOne == chatTwo, false)
    }
}
