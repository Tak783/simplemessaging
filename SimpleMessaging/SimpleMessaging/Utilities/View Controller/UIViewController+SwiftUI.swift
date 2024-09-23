//
//  UIViewController+SwiftUI.swift
//  SimpleMessaging
//
//  Created on 23/09/2024.
//

import UIKit

extension UIViewController {
    public func addEdgeToEdgeConstraints(forSwiftUIView swiftUIView: UIView) {
        view.addEdgeToEdgeConstraints(forSwiftUIView: swiftUIView)
    }
}

extension UIView {
    public func addEdgeToEdgeConstraints(forSwiftUIView swiftUIView: UIView) {
        NSLayoutConstraint.activate([
            swiftUIView.topAnchor.constraint(equalTo: topAnchor),
            swiftUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            swiftUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            swiftUIView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
