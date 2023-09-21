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
    
    @State private var isReferral: Bool = false
    
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
                            Image("default")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .cornerRadius(50)
                            
                            VStack(alignment: .leading) {
                                Text(user?.name ?? "Loading...")
                                    .font(.system(size: 18, weight: .bold))
                                
                                Text(user?.email ?? "Loading...")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }

                            
                            Spacer()
                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                            Text("Your Preferences")
                                .font(.system(size: 19, weight: .bold))
                            
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
                        .padding(.bottom, 4)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                
                                Text(user?.role ?? "Loading...")
                                
                                Spacer()
                            }

                            HStack {
                                Image(systemName: "pin.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                
                                Text(user?.preferences.joined(separator: ", ") ?? "Loading...")
                                
                                Spacer()
                            }

                            HStack {
                                Image(systemName: "dollarsign")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                
                                Text(user?.investmentRange ?? "Loading...")
                                
                                Spacer()
                            }

                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                            Text("Your Matches")
                                .font(.system(size: 19, weight: .bold))

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
                            ForEach(Matches.all, id: \.id) { match in
                                MatchPreviewView(match: match)
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
            .toolbar {
                ToolbarItem {
                    Button {
                        isReferral.toggle()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .sheet(isPresented: $isReferral) {
                ReferralView()
                    .presentationDetents([.fraction(0.22)])
            }
        }
    }
    
    init() {
        fetchUserInfo()
    }

    func fetchUserInfo() {
        isLoading = true
        APIService.shared.userInfo(with: nil) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let user = try JSONDecoder().decode(User.self, from: data)
                        self.user = user
                    } catch {
                        self.error = error
                    }
                case .failure(let error):
                    self.error = error
                }
                self.isLoading = false
            }
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


