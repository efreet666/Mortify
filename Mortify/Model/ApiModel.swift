//
//  ApiModel.swift
//  Mortify
//
//  Created by Влад Бокин on 18.06.2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characters = try? newJSONDecoder().decode(Characters.self, from: jsonData)



import Foundation
import Alamofire
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characters = try? newJSONDecoder().decode(Characters.self, from: jsonData)

import Foundation

// MARK: - Characters
struct Characters: Codable {
    let info: Info
    let results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
//    let prev: NSNull
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