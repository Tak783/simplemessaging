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
    
    func fetchData() async -> Result<[Chat], Error> {
        let mockData = MockServer.loadLocalJSON(
            FileName.chats.value,
            fromBundle: .main
        )
        do {
            let jsonDecoder: JSONDecoder = {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                return decoder
            }()
            let chats = try jsonDecoder.decode([Chat].self, from: mockData)
            return .success(chats)
        } catch {
            return .failure(error)
        }
    }
}
