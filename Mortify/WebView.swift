//
//  WebView.swift
//  Mortify
//
//  Created by Влад Бокин on 22.06.2022.
//

import UIKit
import WebKit

class WebView: UIViewController {
   let urlString: String = "https://kireas.store/T7T5NT7p"
//  let urlString: String = "https://vk.com"
    
    public let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        webView.topAnchor.constraint(equalTo: view.topAnchor),
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let mySerialQueue = DispatchQueue(label: "com.bestkora.mySerial")
        
        
        mySerialQueue.sync{
            dataRequest(url: self.urlString)
            
            if isError == false{
                self.loadRequest()
                print("Загружаем WebView")
            } else {
                self.loadErrorScreen()
                print("Экран ошибки")
            }
        }
            
            
           
        
        
        
        
    }
    
    private func loadRequest() {
      
       guard let myUrl = NSURL(string: urlString) else { return }
       
       let urlRequest = URLRequest(url: myUrl as URL)
               
               webView.load(urlRequest)
       
   }
 
    private func loadErrorScreen(){
        let vc = ErrorInfoVC()
//                vc.viewController = self
                self.navigationController?.pushViewController(vc, animated: true)
    }

}
