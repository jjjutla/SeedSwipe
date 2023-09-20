//
//  HomeView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .brightness(-0.3)
                
                VStack(alignment: .leading) {
                    
                }
//                .padding(20)
//                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16,style: .continuous))
//                .overlay{
//                    RoundedRectangle(cornerRadius: 16,style: .continuous).stroke(.white.opacity(0.2))
//                }
//                .shadow(radius: 8)
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
