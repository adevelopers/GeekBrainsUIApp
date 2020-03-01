//
//  FriendListViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import VkApiCore
import VkApiKit


struct Section<T> {
    var title: String
    var items: [T]
}

protocol FriendsListView: class {
    func update()
}

class FriendListViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    let session = Session.shared
    let api: VKApiProtocol = VKApi()
    let customTransitioningDelegate = CustomTransitioningDelegate()
    
    var presenter: FriendsPresenter?
    var configurator: FriendsConfigurator?
    
    
//    var items: [VKUser] = []
//    var friendsSections = [Section<VKUserProtocol>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator?.configure(view: self)
        setupActionHideKeyboard()
        transitioningDelegate = customTransitioningDelegate
        
        presenter?.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let segueId = segue.identifier,
            segueId == "friendDetailSegue",
            let friendViewController = segue.destination as? FriendViewController,
            let selectedIndex = tableView.indexPathForSelectedRow
        {
            friendViewController.model = presenter?.getModelAtIndex(indexPath: selectedIndex)
        }
    }
    
    
    // MARK: DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.getTitleForSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseId, for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        if let model = presenter?.getModelAtIndex(indexPath: indexPath) {
            cell.configure(with: model)
        }
        return cell
    }
    
    private func handleUsers(items: [VKUserProtocol]) -> [Section<VKUserProtocol>] {
        return  Dictionary(grouping: items) { $0.lastName.prefix(1) }
            .map { Section<VKUserProtocol>(title: "\($0.key)",
                items: $0.value) }
            .sorted(by: {$0.title < $1.title })
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return presenter?.getSectionIndexTitles()
    }
    
    private func setupActionHideKeyboard() {
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tableView.addGestureRecognizer(tapOnView)
    }
    
    @objc
    private func hideKeyboard() {
        tableView?.endEditing(true)
    }
}

extension FriendListViewController: FriendsListView {
    func update() {
        tableView.reloadData()
    }
}


