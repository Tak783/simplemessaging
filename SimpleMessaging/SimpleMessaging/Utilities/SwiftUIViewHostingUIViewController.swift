//
//  SwiftUIViewHostingUIViewController.swift
//  SimpleMessaging
//
//  Created on 23/09/2024.
//

import Foundation
import UIKit

public protocol SwiftUIViewHostingUIViewController: UIViewController {
    func hideNavigationBar()
}

// MARK: - Default Implementation
extension SwiftUIViewHostingUIViewController {
    public func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
