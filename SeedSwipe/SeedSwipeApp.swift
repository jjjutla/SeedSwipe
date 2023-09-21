//
//  SeedSwipeApp.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 18/09/2023.
//

import SwiftUI

@main
struct SeedSwipeApp: App {
    @StateObject var chatViewModel = ChatViewModel()
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .environmentObject(chatViewModel)
                .preferredColorScheme(.dark)
        }
    }
}
