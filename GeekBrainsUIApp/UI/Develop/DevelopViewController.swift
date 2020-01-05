//
//  DevelopViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class DevelopViewController: UIViewController {
    
    let searchBar = CustomSearchBar()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(searchBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        searchBar.backgroundColor = .author
    }
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(24)
        }
    }
}
