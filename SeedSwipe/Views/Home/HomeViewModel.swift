//
//  HomeViewModel.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

class HomeViewModel: ObservableObject {
    
    @Published var companies: [Company] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    init() {
        fetchMatches()
    }

    func fetchMatches() {
        isLoading = true
        APIService.shared.match(with: nil) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let matches = try JSONDecoder().decode([Company].self, from: data)
                        self.companies = matches
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

