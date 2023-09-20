//
//  ChatViewModel.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = [

        Message(content: "Hello!", role: .receiver),
        Message(content: "Hi there! How can I help you today?", role: .user)
    ]
    
    @Published var currentInput: String = ""
    
    func sendMessage() {
        guard !currentInput.isEmpty else { return }
        
        // Add the user's message
        messages.append(Message(content: currentInput, role: .user))
        
        // For demonstration purposes, add a chatbot response after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.messages.append(Message(content: "I'm a bot, so this is a fake reply!", role: .receiver))
        }
        
        currentInput = ""
    }
}
