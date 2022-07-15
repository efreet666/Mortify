//
//  WebView.swift
//  Mortify
//
//  Created by Влад Бокин on 22.06.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    public var isError: Bool = false
    private var isLoad: Bool?
    
    let webView = WKWebView()
    
    // MARK: - Hide navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        
        // MARK: - Show activity view
        DispatchQueue.main.async {
            self.dataRequest()
            self.showSpiner()
        }
        
    }
    // MARK: - Create webView
    func setupWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Check 404 error
    
    func dataRequest() {
        MyNetworkService.fetchUserData(MyNetworkService.URL) { [weak self] result in
            switch result {
            case .success(let data):
                print(data as Any)
                self?.isError = false
                print("URL is working")
                self?.fetchCountryData()
            case .failure(let error):
                if error.localizedDescription == "Response status code was unacceptable: 404." {
                    self?.isError = true
                    print("Ошибка 404")
                    self?.loadErrorScreen()
                } else {
                    print("error.localizedDescription")
                    self?.loadErrorScreen()
                   // self?.fetchCountryData()
                }
            }
        }
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
                print("User's country: \(userCountry)")
                
                // Check user's country
                if targetCountries.contains(userCountry) {
                    self?.isError = false
                    print("User's coutry is acceptable")
                    self?.loadVC()
                }
                
            case .failure(let err):
                self?.loadErrorScreen()
                print(err)
            }
        }
    }
    
    // MARK: - Load WebView
    func loadWebView() {
        
        guard let myUrl = NSURL(string: MyNetworkService.URL) else { return }
        let urlRequest = URLRequest(url: myUrl as URL)
        webView.load(urlRequest)
        webView.backgroundColor = .black
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
    }
    
    // MARK: - Check page loading progress
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(Float(webView.estimatedProgress))
            if Float(webView.estimatedProgress) == 1.0 {
                DispatchQueue.main.async {
                    self.removeSpiner()
                    print("WebView loaded")
                }
            }
        }
    }
    
    // MARK: - Load ErrorScreen
    func loadErrorScreen() {
        let errorVC = ErrorInfoVC()
        DispatchQueue.main.async {
            self.removeSpiner()
        }
        self.navigationController?.pushViewController(errorVC, animated: false)
        print("Error screen loaded")
    }
    
    // MARK: - Check errors
    func loadVC() {
        let langIsSupport = checkLang()
        if langIsSupport == true && isError == false {
            loadWebView()
        } else {
            loadErrorScreen()
        }
    }
    
}
