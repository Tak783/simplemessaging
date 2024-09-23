//
//  ChatFeedTableViewCell+DSLHelpers.swift
//  SimpleMessagingTests
//
//  Created by  on 23/09/2024.
//

import UIKit
@testable import SimpleMessaging

// MARK: - Domain Specific Language Variables (DSLs)
extension ChatFeedTableViewCell {
    var dslTitleLabel: UIView? {
        findChildView(byAccessibilityIdentifier: "title_label")
    }
    
    var dslDetailLabel: UIView? {
        findChildView(byAccessibilityIdentifier: "detail_label")
    }
}
