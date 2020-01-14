//
//  AuthViewController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 13.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import UIKit
import WebKit
import SnapKit
import Alamofire


final class AuthViewController: UIViewController {
    let clientId = "7280632"
    
    lazy var webView: WKWebView = {
        let webConfig = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.navigationDelegate = self
        return webView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        connect()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            
            VKApi().getFriends()
        })
    }
    
    private func setupUI() {
        view.addSubview(webView)
    }
    private func setupConstraints() {
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func connect() {
        // web config
        
    
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.103"),
            
            
        ]
        print(urlComponents.url?.absoluteString)
        
        if let url = urlComponents.url {
            webView.load(URLRequest(url: url))
        }
    }
}

extension AuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment.components(separatedBy: "&")
                            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { value, params in
                var dict = value
                let key = params[0]
                let value = params[1]
                dict[key] = value
                return dict
            }
        
            Session.shared.token = params["access_token"] ?? "69518adc85e5674c88d58f55ba822a443e1555315a28b169a40a57de0657b2bef90c5999931d34f79c563"
            Session.shared.userId = params["user_id"] ?? "0"
        
            print(params)
            decisionHandler(.cancel)
        }
        
}



class VKApi {
    let vkURL = "https://api.vk.com/method/"
    
    func getFriends() {
        let requestURL = vkURL + "friends.get"
        let params = ["v": "5.103",
                      "access_token": Session.shared.token,
                      "order": "name",
                      "fields": "city, fomain"
        ]
        
        
        Alamofire.request(requestURL,
                          method: .get,
                          parameters: params)
                .responseString(completionHandler: { result in
                            print(result)
                          })
    }
    
}
