//
//  MatchesModel.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import Foundation

struct Matches: Identifiable, Equatable {
    
    let id: UUID = UUID()
    let name: String
    let imageUrl: String
    let background: String
    let location: String
    
}

extension Matches {
    static let first = Matches(name: "Databricks", imageUrl: "databricks", background: "newyork", location: "NY, USA")
    static let second = Matches(name: "Blair", imageUrl: "blair", background: "sf", location: "SF, USA")
    
    static let all: [Matches] = [.first, .second]

}
