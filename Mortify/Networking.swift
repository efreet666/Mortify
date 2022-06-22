//
//  Networking.swift
//  Mortify
//
//  Created by Влад Бокин on 17.06.2022.


import Foundation
import Alamofire

 //public var URL = "https://kireas.store/T7T5NT7p"
public let URL = "https://vk.com"
let checkURL = "http://ip-api.com/json/"
public var isError: Bool = false

func dataRequest(url: String){
    
    AF.request(checkURL, method: .get)
        .validate()
        .responseJSON{ dataResponse in
            switch dataResponse.result{
            case .success(let value):
                print(value)
                guard let data = value as? UserInfo else { return }
                
                let userInfoResult = UserInfo(status: data.status, country: data.country, countryCode: data.countryCode, region: data.region, regionName: data.regionName, city: data.city, zip: data.zip, lat: data.lat, lon: data.lon, timezone: data.timezone, isp: data.isp, org: data.org, userInfoAs: data.userInfoAs, query: data.query)
                
                
                print(userInfoResult)
            case .failure(let error):
                print(error)
                
           
        }
    }
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





