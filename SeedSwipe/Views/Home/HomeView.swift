//
//  HomeView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

import SwiftUI
import AlertToast

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State private var showToast = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .brightness(-0.3)
                
                if homeViewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    if homeViewModel.companies.isEmpty {
                        DoneView {
                            homeViewModel.fetchMatches()
                        }
                    } else {
                        ForEach(homeViewModel.companies, id: \.id) { company in
                            CompanySwipeView(company: company) { likeType in
                                withAnimation { homeViewModel.companies.removeAll { $0.id == company.id } }
                                onLike(company, type: likeType)
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .toast(isPresenting: $showToast){
                AlertToast(displayMode: .hud, type: .regular, title: "Matched!")
            }
        }
    }

    
    func removeCompany(_ company: Company) {
        guard let index = companies.firstIndex(of: company) else { return }

        companies.remove(at: index)
    }

    func onLike(_ company: Company, type likeType: LikeType) {
        switch likeType {
        case .like:
            print("You disliked \(company.name)")
        case .dislike:
            showToast.toggle()
            chatViewModel.hasAddedChat.toggle()
            print("You liked \(company.name)")
        case .interested:
            print("You're interested \(company.name)")
        }
    }
    
    func fetchMatches() {
        isLoading = true
        APIServiceHugging.shared.fetchMatches { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let companyNames):

                    self.companies = companyNames.map { Company(name: $0) }
                case .failure(let error):
                    self.error = error
                }
                self.isLoading = false
            }
        }
    }
}

private struct DoneView: View {
    let reload: () -> Void
    var body: some View {
        VStack {
            Text("You've filled in all the cards!")

            Button("Refresh") {
                reload()
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.blue)
        }
    }
}

//#Preview {
//    HomeView()
//        .preferredColorScheme(.dark)
//}
