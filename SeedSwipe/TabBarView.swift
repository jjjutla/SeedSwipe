//
//  TabBarview.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
}
