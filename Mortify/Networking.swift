//
//  Networking.swift
//  Mortify
//
//  Created by Влад Бокин on 17.06.2022.


import Foundation
import Alamofire

public var URL = "https://kireas.store/T7T5NT7p"
public var isError: Bool = false
public var anotherCountry = false



enum ObtainResult {
    case success(UserInfo)
    case failure(Error)
}

public func dataRequest(url: String){
    AF.request(url, method: .get)
        .validate()
        .responseJSON{ dataResponse in
            switch dataResponse.result{
            case .success(let value):
                print(value)
                isError = false
                
                print("Успешно")
            case .failure(let error):
                if error.localizedDescription == "Response status code was unacceptable: 404." {
                    isError = true
                    print("Ошибка 1")
                }
            }
            
        }
    
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





