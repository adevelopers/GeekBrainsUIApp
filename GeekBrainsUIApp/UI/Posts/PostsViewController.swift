//
//  PostsViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit


final class PostsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PikachuCell.self, forCellReuseIdentifier: PikachuCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    let presenter: PostsPresenter
    
    init(presenter: PostsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новости"
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PikachuCell.reuseIdentifier, for: indexPath) as? PikachuCell {
            let model = presenter.modelForRowAt(indexPath)
            cell.configure(model: model)
            cell.backgroundColor = .blue
            
            return cell
        }
        
        return UITableViewCell()
    }

}

extension PostsViewController: UITableViewDelegate {
    
}
