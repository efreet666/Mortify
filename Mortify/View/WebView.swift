//
//  WebView.swift
//  Mortify
//
//  Created by Влад Бокин on 22.06.2022.
//

import Foundation
import UIKit
import WebKit
import Alamofire

class WebView: UIViewController {
    
    //let urlString: String = "https://kireas.store/T7T5NT7p"
    let urlString: String = "https://melbet.ru/"
    public var isError: Bool = false
    private var isLoad: Bool?

    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        dataRequest(url: self.urlString)
        
        print("dataRequest is loading")
        // MARK: - Show activity view
        DispatchQueue.main.async {
            self.showSpiner()
        }
        
}
    // MARK: - Create webView
    func setup() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
  
    // MARK: - Check country

    func fetchCountryData() {
        // Our target coutries
        let targetCountries = "Kazakhstan, Turkey, Azerbaijan, Uzbekistan, Ukraine, India, Russia"
        var country: String?
            MyNetworkService.fetchData(MyNetworkService.checkURL) { [weak self] result in
                switch result {
                case .success(let infoDataModel):
                    country = infoDataModel.country
                    guard let userCountry =  country else { return }
                    Swift.print("User's country: \(userCountry)")

                    // Check user's country
                    if targetCountries.contains(userCountry) {
                        self?.isError = false
                        Swift.print("User's coutry is acceptable")
                        self?.loadVC()
                    }
                   
                case .failure(let err):
                    self?.loadVC()
                    Swift.print(err)
                }
            }
    }
    
    func dataRequest(url: String) {
            MyNetworkService.fetchUserData(url) { [weak self] result in
                switch result {
                case .success(let data):
                    print(data as Any)
                    self?.isError = false
                    print("URL is working")
                    self?.fetchCountryData()
                case .failure(let error):
                    if error.localizedDescription == "Response status code was unacceptable: 404." {
                        self?.isError = true
                        Swift.print("Ошибка 404")
                        self?.fetchCountryData()
                    }
                }
        }
    }
     
// MARK: - Load WebView
func loadRequest() {
    guard let myUrl = NSURL(string: urlString) else { return }
    let urlRequest = URLRequest(url: myUrl as URL)
    webView.load(urlRequest)
    print("WebView loaded")

}

// MARK: - Load ErrorScreen
 func loadErrorScreen() {
    let errorVC = ErrorInfoVC()
    self.navigationController?.pushViewController(errorVC, animated: false)

}

// MARK: - Check errors
func loadVC() {
    checkLang()
    if self.isError == false {
      loadRequest()
        print("Loading WebView")
        DispatchQueue.main.async {
            self.removeSpiner()
        }
    } else {
        loadErrorScreen()
        print("Error screen")
        self.removeSpiner()
    }
}

}
