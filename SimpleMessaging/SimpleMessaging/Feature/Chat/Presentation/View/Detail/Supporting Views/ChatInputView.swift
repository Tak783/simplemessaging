//
//  ChatInputView.swift
//  SimpleMessaging
//
//  Created on 23/09/2024.
//

import SwiftUI

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
