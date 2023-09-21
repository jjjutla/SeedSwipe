//
//  APIServiceHugging.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 21/09/2023.
//

import Foundation

class APIServiceHugging {
    static let shared = APIService()

    let baseURL = "https://api-inference.huggingface.co/models/jjjutla/fastgen-model"

    func fetchMatches(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("hfoiwno92n23oino23i23ij2ji3ub23", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(["inputs": "Generate 5 company matches"])

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode([String: String].self, from: data)
                    let companies = result["generated_text"]?.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespaces)) }
                    completion(.success(companies ?? []))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

