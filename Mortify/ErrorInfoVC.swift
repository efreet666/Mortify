//
//  ErrorInfoVC.swift
//  Mortify
//
//  Created by Влад Бокин on 22.06.2022.
//

import UIKit

class ErrorInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let errorLabel = UILabel()
           errorLabel.frame = CGRect(x: 110, y: 100 , width: 250, height: 150)
               errorLabel.text = "Произошла ошибка"
               errorLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
               self.view.addSubview(errorLabel)
        
        let errorImage = UIImageView()
        errorImage.frame = CGRect(x: 210, y: 400 , width: 350, height: 350)
        errorImage.image = UIImage(named: "1")
        errorImage.contentMode = .scaleAspectFit
               self.view.addSubview(errorImage)
      
    }
    
    



}
