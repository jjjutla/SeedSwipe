//
//  APIService.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 21/09/2023.
//

import Foundation

class APIService {
    
    private let baseURL = "https://seedswipehack.fastgenapp.com"
        static let shared = APIService()
    
    private init() { }
    
    private func makePostRequest(to endpoint: String, body: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            completion(.failure(NSError(domain: "", code: 400, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
            
        }.resume()
    }
    
    func signup(with body: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        makePostRequest(to: "/auth/signup", body: body, completion: completion)
    }
    
    func signin(with body: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        makePostRequest(to: "/auth/signin", body: body, completion: completion)
    }
    
    func users(with body: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        makePostRequest(to: "/users", body: body, completion: completion)
    }
    
    func userInfo(with body: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        makePostRequest(to: "/userinfo", body: body, completion: completion)
    }
    
    func match(with body: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        makePostRequest(to: "/match", body: body, completion: completion)
    }
    
    func payment(with body: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        makePostRequest(to: "/payment", body: body, completion: completion)
    }
}

