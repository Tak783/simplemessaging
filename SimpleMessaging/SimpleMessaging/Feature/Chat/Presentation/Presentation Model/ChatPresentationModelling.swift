//
//  ChatPresentationModelling.swift
//  SimpleMessaging
//
//  Created on 23/09/2024.
//

import Foundation

protocol ChatPresentationModelling: Equatable {
    var id: String { get }
    var name: String { get }
    var lastUpdated: String { get }
}
