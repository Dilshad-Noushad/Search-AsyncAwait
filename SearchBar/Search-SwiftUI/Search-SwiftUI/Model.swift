//
//  Model.swift
//  Search-SwiftUI
//
//  Created by Dilshad N on 31/07/23.
//

import Foundation

//// MARK: - characterData
//struct characterData: Codable {
//    let id: Int
//    let name, status, species, type: String
//    let gender: String
//    let origin, location: Location
//    let image: String
//    let episode: [String]
//    let url: String
//    let created: String
//}
//// MARK: - Location
//struct Location: Codable {
//    let name: String
//    let url: String
//}


// MARK: - Welcome
struct Welcome: Codable {
    let info: Info
    let results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
