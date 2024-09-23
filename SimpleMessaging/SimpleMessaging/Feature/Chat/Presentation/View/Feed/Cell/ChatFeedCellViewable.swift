//
//  ChatFeedCellViewable.swift
//  SimpleMessaging
//
//  Created by  on 23/09/2024.
//

import Foundation

protocol ChatFeedCellViewable {
    func update(
        withPresentationModel chatPresentationModel: any ChatPresentationModelling
    )
}
