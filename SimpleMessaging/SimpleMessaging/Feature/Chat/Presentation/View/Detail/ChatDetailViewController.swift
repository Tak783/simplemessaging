//
//  ChatDetailViewController.swift
//  SimpleMessaging
//
//  Created by Tak Mazarura on 23/09/2024.
//

import UIKit

final class ChatDetailViewController: UIViewController {
    var chatDetailViewModel: ChatDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
}

// MARK: - SwiftUIViewHostingUIViewController
extension ChatDetailViewController: SwiftUIViewHostingUIViewController {}

// MARK: - Set Up View
extension ChatDetailViewController {
    private func setUpView() {
        setUpHostedSwiftUIView()
    }
}

// MARK: - Set Up Settings View
extension ChatDetailViewController {
    private func setUpHostedSwiftUIView() {
        // 1. Set up the SwiftUI view and host it in a `UIHostingController`
        let hostedSwiftUIView = HostedChatView(
            chatDetailViewModel: chatDetailViewModel,
            frame: view.frame
        )
        
        hostedSwiftUIView.view.backgroundColor = .systemBackground
        
        let swiftUIView = hostedSwiftUIView.view!
        swiftUIView.translatesAutoresizingMaskIntoConstraints = false
        
        // 2. Add the ViewController to the destination ViewController.
        addChild(hostedSwiftUIView)
        view.addSubview(swiftUIView)
        
        addEdgeToEdgeConstraints(forSwiftUIView: swiftUIView)
        
        // 4. Notify the child view controller that the move is complete.
        hostedSwiftUIView.didMove(toParent: self)
    }
}
