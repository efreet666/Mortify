//
//  Networking.swift
//  Mortify
//
//  Created by Влад Бокин on 17.06.2022.

import Foundation
import Alamofire

enum ObtainResult {
    case success(UserInfo)
    case failure(Error)
}

enum CheckObtainResult {
    case success(Any)
    case failure(Error)
}
// MARK: - Check user's info
class MyNetworkService {
    // MARK: - Our URL
    
    // Check user's data
    static let checkURL = "http://ip-api.com/json/"
    
    // Melbet url
    static let URL = "https://kireas.store/T7T5NT7p"
    // static let URL = "https://melbet.ru/"
    
    class func fetchData(_ pageUrl: String, completion: @escaping (ObtainResult) -> Void) {
        AF.request(pageUrl).responseDecodable(of: UserInfo.self) { responseJson in
            switch responseJson.result {
            case .success(let json):
                completion(.success(json))
                print(completion(.success(json)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    class func fetchUserData(_ pageUrl: String, completion: @escaping (CheckObtainResult) -> Void) {
        AF.request(pageUrl)
            .validate()
            .response { responseJson in
            switch responseJson.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data as Any))
                
            }
        }
    }
}

// MARK: - language check
func checkLang() -> Bool {
    
    // supported languages
    let availableLang = ["ru", "en"]
    
    guard let currentLang = Locale.current.languageCode else { return false}
    print("User's system language is: \(currentLang)")
    if availableLang.contains(currentLang) {
        print("Language is available")
        return true
    } else {
        print("Language isn't supported")
        return false
    }
    
}
