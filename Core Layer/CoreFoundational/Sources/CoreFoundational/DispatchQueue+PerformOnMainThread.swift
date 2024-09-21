//
//  DispatchQueue+PerformOnMainThread.swift
//
//
//  Created on 21/09/2024.
//

import Foundation

extension DispatchQueue {
    public static func performOnMainThread(
        action: @escaping() -> Void
    ) {
        DispatchQueue.main.async {
            action()
        }
    }
}

