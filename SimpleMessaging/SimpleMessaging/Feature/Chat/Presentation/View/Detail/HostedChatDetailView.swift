//
//  HostedChatDetailView.swift
//  SimpleMessaging
//
//  Created on 23/09/2024.
//

import UIKit
import SwiftUI

final class HostedChatView: UIHostingController<ChatView> {
    public init(
        chatDetailViewModel: ChatDetailViewModel,
        frame: CGRect
    ) {
        let swiftUIView = ChatView(
            chatDetailViewModel: chatDetailViewModel
        )
        super.init(rootView: swiftUIView)
        view.frame = frame
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
