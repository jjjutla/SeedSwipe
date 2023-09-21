//
//  CompanyModel.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import Foundation

struct Company: Identifiable, Equatable {
    
    let id: UUID = UUID()
    let name: String
    let imageUrl: String
    let location: String
    let size: String
    let funding: String
    let websiteUrl: String
    let mediaUrl: String
    
}

extension Company {
    static let first = Company(name: "Terra API", imageUrl: "terra", location: "London, UK", size: "11-50", funding: "Seed", websiteUrl: "tryterra.co", mediaUrl: "terra_preview")
    static let second = Company(name: "Fastgen", imageUrl: "fastgen", location: "New York, USA", size: "1-10", funding: "Pre-Seed", websiteUrl: "fastgen.com", mediaUrl: "fastgen_preview")
    static let third = Company(name: "Nash", imageUrl: "nash", location: "San Francisco, USA", size: "11-50", funding: "Series A", websiteUrl: "usenash.com", mediaUrl: "nash_preview")
    
    static let all: [Company] = [.first, .second, .third]

}
