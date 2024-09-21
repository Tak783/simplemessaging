//
//  LocalJSONChatService.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import Foundation
import CoreNetworking

final class LocalJSONChatService: ChatServiceable {
    private enum FileName: String {
        case chats = "Chats"
        
        var value: String {
            self.rawValue
        }
    }
    
    private static var mockNetworkingBundle: Bundle {
        Bundle(for: self)
    }
    
    func fetchData(from url: URL) async -> Result<[Chat], Error> {
        let mockData = MockServer.loadLocalJSON(
            FileName.chats.value,
            fromBundle: .main
        )
        do {
            let decoder = JSONDecoder()
            let chats = try decoder.decode([Chat].self, from: mockData)
            return .success(chats)
        } catch {
            return .failure(error)
        }
    }
}
