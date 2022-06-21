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
            case .success(_):
            case .failure(_):
            
        }
    }
    
    
    

}





