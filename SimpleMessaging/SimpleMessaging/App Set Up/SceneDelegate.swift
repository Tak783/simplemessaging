//
//  SceneDelegate.swift
//  SimpleMessaging
//
//  Created on 21/09/2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.frame = windowScene.coordinateSpace.bounds
        
        let chatService = LocalJSONChatService()
        let chatFeedViewModel = ChatFeedViewModel(
            title: "Chats",
            service: chatService
        )
        
        let chatFeedViewController = ChatFeedViewController.instantiate()
        chatFeedViewController.chatFeedViewModel = chatFeedViewModel
        
        let navigationController = UINavigationController(
            rootViewController: chatFeedViewController
        )
        
        // Set the root view controller of the window
        window?.rootViewController = navigationController
        
        // Make the window visible
        window?.makeKeyAndVisible()
    }
}

