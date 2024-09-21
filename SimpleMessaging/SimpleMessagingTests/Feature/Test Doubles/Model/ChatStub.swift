//
//  ChatStub.swift
//  SimpleMessagingTests
//
//  Created by Tak Mazarura on 21/09/2024.
//

import Foundation
@testable import SimpleMessaging

struct ChatStub {
    static func stubbedChatOne() -> Chat {
        Chat(
            id: "5f58bcd7a88fab5f34df94d6",
            name: "eiusmod nostrud sunt",
            lastUpdated: ISO8601DateFormatter().date(from: "2020-05-04T03:37:18Z")!,
            messages: [
                Message(
                    id: "5f58bcd7352396fffbae8b6e",
                    text: "Lorem labore ea et",
                    lastUpdated: ISO8601DateFormatter().date(from: "2020-02-16T04:35:16Z")!
                ),
                Message(
                    id: "5f58bcd7d95151eaa14ab8aa",
                    text: "ex excepteur deserunt laboris",
                    lastUpdated: ISO8601DateFormatter().date(from: "2020-08-18T11:16:45Z")!
                ),
                Message(
                    id: "5f58bcd7f7745918c2252086",
                    text: "dolore sunt reprehenderit cupidatat",
                    lastUpdated: ISO8601DateFormatter().date(from: "2020-03-23T10:06:33Z")!
                )
            ]
        )
    }
    
    static func stubbedChatTwo() -> Chat {
        Chat(
            id: "5f58bcd7200c90cfaac93778",
            name: "laborum irure enim",
            lastUpdated: ISO8601DateFormatter().date(from: "2020-01-18T02:37:10Z")!,
            messages: [
                Message(
                    id: "5f58bcd7fd44c584cdc6a3c3",
                    text: "nostrud eiusmod non ut",
                    lastUpdated: ISO8601DateFormatter().date(from: "2020-07-13T03:56:26Z")!
                ),
                Message(
                    id: "5f58bcd7d5f9b5ff7c3f4216",
                    text: "voluptate nulla commodo reprehenderit",
                    lastUpdated: ISO8601DateFormatter().date(from: "2020-01-02T11:50:36Z")!
                )
            ]
        )
    }
}
