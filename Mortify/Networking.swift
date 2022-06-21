//
//  Networking.swift
//  Mortify
//
//  Created by Влад Бокин on 17.06.2022.


import Foundation
import Alamofire

public var URL = "https://rickandmortyapi.com/api/character"
func dataRequest(url: String){
    AF.request(url, method: .get)
        .validate()
        .responseJSON{ dataResponse in
            switch dataResponse.result{
            case .success(let value):
                guard let charactersData = value as? [Characters] else { return }
                
                for characterData in charactersData{
                    let character = Characters(results: [Result(name: characterData["name"], image: <#T##String#>, url: <#T##String#>)])
                }
            case .failure(let error):
                print(error)
        }
    }
    
    
    

}





