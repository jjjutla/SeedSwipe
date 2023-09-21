//
//  MessagePreviewModel.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 21/09/2023.
//

import Foundation

struct MessagePreview: Identifiable, Equatable {
    
    let id: UUID = UUID()
    let name: String
    let imageUrl: String
    let fromYou: Bool
    let lastMessage: String
    let time: String
    
}

extension MessagePreview {
    static let first = MessagePreview(name: "Fastgen", imageUrl: "fastgen", fromYou: false, lastMessage: "", time: "2:04")
    static let second = MessagePreview(name: "Databricks", imageUrl: "databricks", fromYou: false, lastMessage: "That's great to hear!", time: "19:56")
    static let third = MessagePreview(name: "Blair", imageUrl: "blair", fromYou: true, lastMessage: "What kind of amount are you looking for?", time: "14:23")
    
    static let all: [MessagePreview] = [.first, .second, .third]
    static let almost_all: [MessagePreview] = [.second, .third]
}
