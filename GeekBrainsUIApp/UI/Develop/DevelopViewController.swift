//
//  DevelopViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import VkApiKit

final class DevelopViewController: UIViewController {
    
    private let api = VKApi()
    
    private lazy var button: UIButton = {
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
        print("didTap")
        UserDefaults.standard.isAuthorized = false
        UserDefaults.standard.userId = 0
    }
}
