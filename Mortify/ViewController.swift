//
//  ViewController.swift
//  Mortify
//
//  Created by Влад Бокин on 17.06.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        AF.request("https://rickandmortyapi.com/api/character").response { response in
//            print(response)
//        }
        
        struct DecodableType: Decodable { let url: String }

        AF.request("https://rickandmortyapi.com/api/character").responseDecodable(of: DecodableType.self) { response in
            print("Response: \(response)")
        }
    }


}

