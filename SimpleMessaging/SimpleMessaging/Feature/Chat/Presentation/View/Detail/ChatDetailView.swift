//
//  ChatDetailView.swift
//  SimpleMessaging
//
//  Created by  on 23/09/2024.
//

import CoreFoundational
import SwiftUI

struct ChatView: View {
    @ObservedObject var chatDetailViewModel: ChatDetailViewModel
    
    @State private var messageText: String = .empty
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
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
                
                ChatInputView(messageText: $messageText) { newMessage in
                    sendMessage(newMessage)
                }
            }
        }
    }
}

// MARK: - Send Message
extension ChatView {
    private func sendMessage(_ message: String) {
        chatDetailViewModel.sendMessage(withText: message)
    }
}

struct ChatInputView: View {
    @Binding var messageText: String
    
    var onSend: (String) -> Void

    var body: some View {
        HStack {
            TextField("Type a message...", text: $messageText)
                .padding(12)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(20)
            
            Button(action: {
                sendMessage()
            }) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            .disabled(messageText.isEmpty)
        }
        .padding()
    }
    
    private func sendMessage() {
        onSend(messageText)
    }
}
