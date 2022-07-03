//
//  WebView.swift
//  Mortify
//
//  Created by Влад Бокин on 22.06.2022.
//

import UIKit
import WebKit
import Alamofire

class WebView: UIViewController {
    let urlString: String = "https://kireas.store/T7T5NT7p"
    // let urlString: String = "https://melbet.ru/"

    public var isError: Bool = false
    public let webView = WKWebView()
    private var isLoad: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Create webView
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // MARK: - Show activity view
        DispatchQueue.main.async {
            self.showSpiner()
        }

        // MARK: - Use dispatch group
        let concurrentQueue = DispatchQueue(label: "ru.mort.concurrent-queue", attributes: .concurrent)

        let group = DispatchGroup()

        let workItem1 = DispatchWorkItem { [self] in
            func dataRequest(url: String) {

                // MARK: - check 404 error
                DispatchQueue.main.async {
                    AF.request(url, method: .get)
                        .validate()
                        .response { dataResponse in
                            switch dataResponse.result {
                            case .success(let value):
                                print(value as Any)
                                self.isError = false
                                print("Успешно")
                                self.loadVC()
                            case .failure(let error):
                                if error.localizedDescription == "Response status code was unacceptable: 404." {
                                    self.isError = true
                                    print("Ошибка 404")
                                    self.loadVC()
                                }
                            }
                        }
                }
            }
            dataRequest(url: self.urlString)
            print("dataRequest is loading")
            group.leave()

        }

        let workItem2 = DispatchWorkItem {
            self.fetchCountryData(MyNetworkService.checkURL)
            print("fetchCountryData is loading")
            group.leave()

        }

        group.enter()
        concurrentQueue.async(execute: workItem1)

        group.enter()
        concurrentQueue.async(execute: workItem2)

        group.wait()

    }

    // MARK: - Check country

    // Our target coutries
    let targetCountries = "Kazakhstan, Turkey, Azerbaijan, Uzbekistan, Ukraine, India, Russia"
    public var country: String?

    func fetchCountryData(_ pageUrl: String) {
        DispatchQueue.main.async {
            MyNetworkService.fetchData(pageUrl) { [weak self] result in
                switch result {
                case .success(let infoDataModel):
                    // Decode response into data model
                    self?.country = infoDataModel.country
                    guard let userCountry = self?.country else { return }
                    print("User's country: \(userCountry)")

                    // Check user country
                    if self!.targetCountries.contains(userCountry) {
                        self?.isError = false
                        print("User's coutry is acceptable")
                    }
                case .failure(let err):
                    print(err)
                }
            }
        }

    }

    // MARK: - Load WebView
    public func loadRequest() {
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

    // MARK: - language check
    func checkLang() {
        let availableLang = ["ru", "en"]
        guard let currentLang = Locale.current.languageCode else { return }
        print("User's system language is: \(currentLang)")
        if availableLang.contains(currentLang) {
            print("Language is available")
        } else {
            isError = true
        }
    }

    // MARK: - Check errors
    public func loadVC() {
        checkLang()
        if self.isError == false {
            self.loadRequest()
            print("Loading WebView")
            DispatchQueue.main.async {
                self.removeSpiner()
            }
        } else {
            self.loadErrorScreen()
            print("Error screen")
            self.removeSpiner()
        }
    }
}
