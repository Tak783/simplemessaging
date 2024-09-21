//
//  StubChatService.swift
//  SimpleMessagingTests
//
//  Created on 21/09/2024.
//

import Foundation
@testable import SimpleMessaging

final class StubChatService: ChatServiceable {
    func fetchData() async -> Result<[Chat], Error> {
        .success(Self.stubbedChats())
    }
    
    static func stubbedChats() -> [Chat] {
        [
            ChatStub.stubbedChatOne(),
            ChatStub.stubbedChatTwo(),
            Chat(
                id: "5f58bcd7c23d93722017ccb6",
                name: "ex cupidatat elit",
                lastUpdated: ISO8601DateFormatter().date(from: "2020-05-15T06:24:26Z")!,
                messages: [
                    Message(
                        id: "5f58bcd72dfebe40537c379e",
                        text: "amet sint laborum ut",
                        lastUpdated: ISO8601DateFormatter().date(from: "2020-05-14T12:24:10Z")!
                    ),
                    Message(
                        id: "5f58bcd7b449b1cfae268ee1",
                        text: "nostrud adipisicing Lorem aute",
                        lastUpdated: ISO8601DateFormatter().date(from: "2020-07-31T04:26:38Z")!
                    ),
                    Message(
                        id: "5f58bcd7357fd38a634ada62",
                        text: "proident nisi in nulla",
                        lastUpdated: ISO8601DateFormatter().date(from: "2020-07-13T12:50:37Z")!
                    )
                ]
            )
        ]
    }
}
