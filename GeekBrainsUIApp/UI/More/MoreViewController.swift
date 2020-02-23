//
//  MoreViewController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 04.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift

final class MoreViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    var items: Results<RealmVKGroup>!
    var notificationsToken: NotificationToken?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        loadRealm()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func loadRealm() {
        print("\(type(of: self)).\(#function)")
        items = try? GroupRepository().getObjects()
        notificationsToken = items.observe { [weak self] changes in
            switch changes {
            case .initial:
                self?.tableView.reloadData()
                break
            case let .update(_, deletions: deletions, insertions: insertions, modifications: modifications):
                self?.tableView.beginUpdates()
                self?.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) },
                                           with: .left)
                self?.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) },
                                           with: .automatic)
                self?.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self?.tableView.endUpdates()
                print("deletions: ", deletions)
                print("insertions: ", insertions)
                print("modifications: ", modifications)
                self?.updateCountTitle()
                break
            case let .error(error):
                print("❌ \(error)")
            }
        }
    }
    
    private func updateCountTitle() {
        title = "\(items.count)"
    }
    
}


extension MoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        let model = items[indexPath.row]
        cell.textLabel?.text = model.name + ", " + (model.text ?? "")
        return cell
    }
    
}


extension MoreViewController: UITableViewDelegate {
      
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = items[indexPath.row]
            GroupRepository().remove(items: [item])
        }
    }
    
    
}
