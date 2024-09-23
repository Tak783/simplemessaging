//
//  ChatFeedViewModelUnitTestsSpec.swift
//  SimpleMessagingTests
//
//  Created on 23/09/2024.
//

import XCTest

protocol ChatFeedViewModelUnitTestsSpec {
    func test_init_initialisesWithExpectedTitle()
    func test_init_defaultInitialisesWithErrorState()
    func test_init_defaultInitialisesWithEmptyChatPresentationModels()
    
    func test_reloadFeed_setsViewModelStateToError()
}

typealias ChatFeedViewModelUnitTest = XCTestCase & ChatFeedViewModelUnitTestsSpec
