//
//  ContentView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 18/09/2023.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var authViewModel = AuthViewModel()
    @State var scrollY : CGFloat = 0
    
    var body: some View {
        ScrollView {
            GeometryReader { reader in
                let minY = reader.frame(in: .named("scroll")).minY
                Color.clear.preference(key:
                    scrollPref.self, value: minY)
            }
            Group{
                
                HStack(alignment: .center) {
                    Image("seedswipe")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                }
                .padding(.bottom, 30)
                
                if authViewModel.showSignInCard {
                    SigninCard(authViewModel: authViewModel)
                }
                else {
                    SignupCard(authViewModel: authViewModel)
                }
            }
        }
        .padding(.top, 40)
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(scrollPref.self, perform: { value in
                scrollY = value
        })
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaleEffect(1 + abs(scrollY/1000))
                .ignoresSafeArea()
                .brightness(-0.4)
        )
        .fullScreenCover(isPresented: $authViewModel.exitAuthPage) {
            TabBarView()
        }
    }
}

#Preview {
    AuthView()
}
