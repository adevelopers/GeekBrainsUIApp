//
//  DevelopViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class DevelopViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Выполнить запросы", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("🔓 Авторизация пройдена")
    }
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
    }
    
    @objc
    private func didTap() {
        let token = Session.shared.token
        let userId = Session.shared.userId
        let api = VKApi(token: token, userId: userId)
        
        // - [x]  **Получение списка друзей;**
        api.getFriends() { result in
            if case let .success(note) = result {
                print("\n✅", note)
            }
        }
        
        // - [x]  **Получение фотографий человека;**
        api.getAllPhotos() { result in
            if case let .success(note) = result {
                print("\n✅", note)
            }
        }
        // - [x]  **Получение групп текущего пользователя;**
        api.getGroups() { result in
            if case let .success(note) = result {
                print("\n✅", note)
            }
        }
        
        // - [x]  **Получение групп по поисковому запросу;**
        api.searchGroups(with: "Geek") { result in
            if case let .success(note) = result {
                print("\n✅", note)
            }
        }
        
    }
}
