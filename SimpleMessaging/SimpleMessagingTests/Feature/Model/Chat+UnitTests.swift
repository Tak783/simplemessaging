//
//  Chat+UnitTests.swift
//  SimpleMessagingTests
//
//  Created by Tak Mazarura on 21/09/2024.
//

import Foundation
import XCTest

final class ChatUnitTests: XCTest {
    func test_equatable_retunsTrueIfIDsAreTheSame() {
        let chatOne = ChatStub.stubbedChatOne()
        let chatTwo = ChatStub.stubbedChatOne()
    
        XCTAssertEqual(chatOne == chatOne, true)
    }
    
    func test_equatable_retunsFalseIfIDsAreNotTheSame() {
        
    }
}
