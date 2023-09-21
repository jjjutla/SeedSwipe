//
//  ChatView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var chatViewModel: ChatViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .brightness(-0.3)
                
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        if chatViewModel.hasAddedChat {
                            ForEach(MessagePreview.all, id: \.id) { message in
                                NavigationLink {
                                    ConversationView()
                                        .environmentObject(ChatViewModel())
                                } label: {
                                    ConversationRowView(messagePreview: user.messages.preview)
                                        .padding(.vertical, 4)
                                }
                                
                                HStack {
                                    Spacer()
                                    
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(.white.opacity(0.1))
                                        .frame(width: UIScreen.screenWidth*0.66, height: 2)
                                }
                            }
                        } else {
                            ForEach(MessagePreview.almost_all, id: \.id) { message in
                                NavigationLink {
                                    ConversationView()
                                        .environmentObject(ChatViewModel())
                                } label: {
                                    ConversationRowView(messagePreview: message)
                                        .padding(.vertical, 4)
                                }
                                
                                HStack {
                                    Spacer()
                                    
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(.white.opacity(0.1))
                                        .frame(width: UIScreen.screenWidth*0.66, height: 2)
                                }
                            }
                        }

                    }
                    
                    Spacer()
                }
                .frame(width: UIScreen.screenWidth * 0.82, height: UIScreen.screenHeight*0.6)
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16,style: .continuous))
                .overlay{
                    RoundedRectangle(cornerRadius: 16,style: .continuous).stroke(.white.opacity(0.2))
                }
                .shadow(radius: 8)
            }
            .navigationTitle("Chats")
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
    ChatView()
        .preferredColorScheme(.dark)
}
