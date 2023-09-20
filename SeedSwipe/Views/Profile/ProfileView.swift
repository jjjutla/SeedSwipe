//
//  ProfileView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 18/09/2023.
//

import SwiftUI

struct ProfileView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .brightness(-0.3)
                
                VStack(alignment: .leading) {
                    ScrollView(.vertical, showsIndicators: false) {
                        HStack(spacing: 16) {
                            Image("monke")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .cornerRadius(50)
                            
                            VStack(alignment: .leading) {
                                Text("Artemiy Malyshau")
                                    .font(.system(size: 18, weight: .bold))
                                
                                Text("amalyshau2002@gmail.com")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                            Text("Your Preferences")
                                .bold()
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("See All")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.white.opacity(0.7))
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.white.opacity(0.7))
                            }
                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                            Text("Your Matches")
                                .bold()
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("See All")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.white.opacity(0.7))
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.white.opacity(0.7))
                            }
                        }
                        
                        LazyVGrid(columns: columns, spacing: 24) {
                            ForEach(1...6, id: \.self) { item in
                                MatchPreviewView()
                            }
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.82, height: UIScreen.screenHeight*0.6)
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16,style: .continuous))
                .overlay{
                    RoundedRectangle(cornerRadius: 16,style: .continuous).stroke(.white.opacity(0.2))
                }
                .shadow(radius: 8)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
