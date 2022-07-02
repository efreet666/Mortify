//
//  WebView.swift
//  Mortify
//
//  Created by Влад Бокин on 22.06.2022.
//

import UIKit
import WebKit

class WebView: UIViewController {
   //let urlString: String = "https://kireas.store/T7T5NT7p"
  let urlString: String = "https://melbet.ru/"
    

    
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
        
       
        let group = DispatchGroup()

        group.enter()
        dataRequest(url: self.urlString)
        print("dataRequest is ")
            group.leave()
        
        group.enter()
        dataRequest(url: self.urlString)
        print("dataRequest is ")
            group.leave()
        
     
        sleep(2)
        loadVC()
          
    }
    //MARK: - Network request
    
    //Our target coutries
    let targetCountries = "Kazakhstan, Turkey, Azerbaijan, Uzbekistan, Ukraine, India, Russia"
    public var country: String?

    func fetchCountryData(_ pageUrl: String){
        DispatchQueue.main.async {
            MyNetworkService.fetchData(pageUrl) { [weak self] result in
                switch result {
                case .success(let infoDataModel):
                    self?.country = infoDataModel.country
                    guard let userCountry = self?.country else { return }
                       print(userCountry)
                    
                    //Check user country
                    if self!.targetCountries.contains(userCountry) {
                        isError = false
                    }
                case .failure(let err):
                    print(err)
                }
            }
        }
    }

    
    public func loadRequest() {
       guard let myUrl = NSURL(string: urlString) else { return }
       let urlRequest = URLRequest(url: myUrl as URL)
               webView.load(urlRequest)
   }
 
    public func loadErrorScreen(){
        let vc = ErrorInfoVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func loadVC(){
        if isError == false{
            loadRequest()
            print("Load WebView")
        } else {
            loadErrorScreen()
            print("Error screen")
        }
    }
}


