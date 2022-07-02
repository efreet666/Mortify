//
//  ApiModel.swift
//  Mortify
//
//  Created by Влад Бокин on 18.06.2022.
//

import Foundation

// MARK: - UserInfo
struct UserInfo: Codable {
    let status, country, countryCode, region: String
    let regionName, city, zip: String
    let lat, lon: Double
    let timezone, isp, org, userInfoAs: String
    let query: String

    enum CodingKeys: String, CodingKey {
        case status, country, countryCode, region, regionName, city, zip, lat, lon, timezone, isp, org
        case userInfoAs = "as"
        case query
    }
}
