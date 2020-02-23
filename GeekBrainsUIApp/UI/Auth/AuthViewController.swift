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
            URLQueryItem(name: "scope", value: "wall, photos, groups, video, status, friends"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.103"),
        ]
        
        if let url = urlComponents.url {
            webView.load(URLRequest(url: url))
        }
    }
    
    private func presentMainScreen() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController = UINavigationController(rootViewController: TabBarController())
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
            print(#function, "go to: .allow")
            UserDefaults.standard.isAuthorized = true
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
        
        Session.shared.token = params["access_token"] ?? ""
            
        if let userId = Int(params["user_id"] ?? "") {
            Session.shared.userId = userId
            UserDefaults.standard.isAuthorized = true
        }
        
        print(params)
        print(#function, "go to cancel")
        
        decisionHandler(.cancel)
        presentMainScreen()
            
    }
}
