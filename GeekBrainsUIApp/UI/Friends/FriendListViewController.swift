//
//  FriendListViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

struct Section<T> {
    var title: String
    var items: [T]
}


class FriendListViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var items: [User] = []
    var friendsSections = [Section<User>]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupActionHideKeyboard()
        loadUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let segueId = segue.identifier,
            segueId == "friendDetailSegue",
            let friendViewController = segue.destination as? FriendViewController,
            let selectedIndex = tableView.indexPathForSelectedRow
        {
            friendViewController.model = friendsSections[selectedIndex.section].items[selectedIndex.row]
        }
    }
    

    // MARK: DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSections[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsSections[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseId, for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        let model = friendsSections[indexPath.section].items[indexPath.row]
        cell.nameLabel.text = model.name
        cell.locationLabel.text = model.location
        cell.setAvatar(with: model.avatar)
        return cell
    }
    
    private func loadUsers() {
        items = User.items
        friendsSections = handleUsers(items: items)
    }
    
    private func handleUsers(items: [User]) -> [Section<User>] {
        return  Dictionary(grouping: items) { $0.lastName.prefix(1) }
                   .map { Section<User>(title: "\($0.key)",
                                        items: $0.value) }
                   .sorted(by: {$0.title < $1.title })
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSections.map { $0.title }
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

extension FriendListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            friendsSections = handleUsers(items: User.items.filter {
                $0.lastName.lowercased().contains(searchText.lowercased())
            })
        } else {
            friendsSections = handleUsers(items: User.items)
        }
    
        tableView.reloadData()
    }
}
