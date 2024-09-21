//
//  Storyboarded.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import Foundation

public protocol Storyboarded {
    static func instantiate(fromBundle bundle: Bundle) -> Self
}
