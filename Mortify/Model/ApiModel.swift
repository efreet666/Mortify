//
//  ApiModel.swift
//  Mortify
//
//  Created by Влад Бокин on 18.06.2022.
//

import Foundation
import Alamofire

//// MARK: - Characters
//struct Characters: Codable {
//    let results: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let name: String
//    let image: String
//    let url: String
//
//}




// MARK: - Characters
struct Characters: Codable {
    let results: [Result]
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

enum Gender: Codable {
    case female
    case male
    case unknown
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: Codable {
    case alien
    case human
}

enum Status: Codable {
    case alive
    case dead
    case unknown
}
