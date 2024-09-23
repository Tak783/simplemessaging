//
//  ChatDetailView.swift
//  SimpleMessaging
//
//  Created by on 23/09/2024.
//

import CoreFoundational
import SwiftUI

struct ChatView: View {
    @ObservedObject var chatDetailViewModel: ChatDetailViewModel
    
    @State private var messageText: String = .empty
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                chatFeed(geometry: geometry)
                ChatInputView(messageText: $messageText) { newMessage in
                    sendMessage(newMessage)
                }
            }
        }
    }
}

// MARK: - Chat Feed
extension ChatView {
    private func chatFeed(geometry: GeometryProxy) -> some View {
        List(chatDetailViewModel.messagePresentationModels) { message in
            HStack {
                VStack(alignment: .leading) {
                    Text(message.text)
                        .padding()
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                        .padding(.vertical, 2)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: geometry.size.width * 0.5, alignment: .leading)
                    Text(message.lastUpdated)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                }
                Spacer(minLength: geometry.size.width * 0.3)
            }
            .listRowSeparator(.hidden, edges: .all)
        }
        .listStyle(.inset)
    }
}

// MARK: - Send Message
extension ChatView {
    private func sendMessage(_ message: String) {
        messageText = .empty
        chatDetailViewModel.sendMessage(
            withText: message
        )
    }
}
