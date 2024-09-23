//
//  Storyboarded+ViewController.swift
//  SimpleMessaging
//
//  Created by  on 21/09/2024.
//

import CoreFoundational
import Foundation
import UIKit

extension Storyboarded where Self: UIViewController {
    private static var storyboardName: String {
        className.deletingSuffix("ViewController")
    }

    public static func instantiate(fromBundle bundle: Bundle = Bundle.main) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("Could not create View Controller with name \(className) from storyboard \(storyboardName)")
        }
        return viewController
    }
}

