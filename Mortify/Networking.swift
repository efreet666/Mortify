//
//  Networking.swift
//  Mortify
//
//  Created by Влад Бокин on 17.06.2022.


import Foundation
import Alamofire

public var URL = "https://rickandmortyapi.com/api/character"
func dataRequest(url: String){
    AF.request(url, method: .get).responseDecodable(of: Characters.self) { response in
        print(response)
    }
    
    
    
//    enum ObtainResult {
//        case success(response: Characters)
//        case failure(error: Error)
//    }
//
//    func alamRequest(complition: @escaping (ObtainResult) -> Void){
//        AF.request(URL).responseDecodable(of: Characters.self) { (responseJSON) in
//            switch responseJSON.result{
//            case .success(let JSON):
//                complition(.success(response: JSON))
//            case .failure(let error):
//                complition(.failure(error: error))
//            }
//
//        }
//    }
}





