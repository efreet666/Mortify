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

        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let errorLabel = UILabel()
           errorLabel.frame = CGRect(x: 110, y: 100 , width: 250, height: 150)
               errorLabel.text = "Произошла ошибка"
               errorLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
               self.view.addSubview(errorLabel)
        
        let errorImage = UIImageView()
        errorImage.frame = CGRect(x: 25, y: 200 , width: 350, height: 350)
        errorImage.image = UIImage(named: "1")
        errorImage.contentMode = .scaleAspectFit
               self.view.addSubview(errorImage)
      
        let reloadDataButton = UIButton()
        reloadDataButton.frame = CGRect(x: 25, y: self.view.frame.size.height - 200, width: self.view.frame.size.width - 50, height: 50)
        reloadDataButton.setTitle("Обновить", for: .normal)
        reloadDataButton.backgroundColor = .orange
               self.view.addSubview(reloadDataButton)
        reloadDataButton.addTarget(self, action: #selector(reloadDataRequest), for: .touchUpInside)
        
        
        
    }
    
    //MARK: - Update data
    @objc func reloadDataRequest(target: UIButton){
        let vc = WebView()
//        vc.loadVC()
        
//        dataRequest(url: vc.urlString)
        vc.fetchCountryData(MyNetworkService.checkURL)
        sleep(2)
        vc.loadVC()
        print("updating data")
        }
   


}

