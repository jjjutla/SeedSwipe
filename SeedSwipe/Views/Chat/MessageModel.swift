//
//  MessageModel.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import Foundation

struct Message: Identifiable, Equatable {
    enum Role {
        case user
        case receiver
    }
    
    let id: UUID = UUID()
    let content: String
    let createAt: Date = Date()
    let role: Role
}
