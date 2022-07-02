//
//  Networking.swift
//  Mortify
//
//  Created by Влад Бокин on 17.06.2022.


import Foundation
import Alamofire

public var URL = "https://kireas.store/T7T5NT7p"
public var isError: Bool?
public var anotherCountry = false

enum ObtainResult {
    case success(UserInfo)
    case failure(Error)
}

class MyNetworkService{
    static let checkURL = "http://ip-api.com/json/"
    
    class func fetchData(_ pageUrl: String, completion: @escaping (ObtainResult) -> ()) {
        AF.request(pageUrl).responseDecodable(of: UserInfo.self) {
            responseJson in
            switch responseJson.result {
            case .success(let json):
                completion(.success(json))
                print(completion(.success(json)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}





