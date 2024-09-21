//
//  ChatServiceable.swift
//  SimpleMessaging
//
//  Created by on 21/09/2024.
//

import Foundation

protocol ChatServiceable {
    func fetchData() async -> Result<[Chat], Error>
}
