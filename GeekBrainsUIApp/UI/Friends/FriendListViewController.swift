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
    
    let session = Session.shared
    let api: VKApiProtocol = VKApi()
    let customTransitioningDelegate = CustomTransitioningDelegate()
    
    
    var items: [VKUserProtocol] = []
    var friendsSections = [Section<VKUserProtocol>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupActionHideKeyboard()
        loadUsers()
        self.transitioningDelegate = customTransitioningDelegate
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
        cell.configure(with: model)
        return cell
    }
    
    private func handleUsers(items: [VKUserProtocol]) -> [Section<VKUserProtocol>] {
        return  Dictionary(grouping: items) { $0.lastName?.prefix(1) }
            .map { Section<VKUserProtocol>(title: "\($0.key!)",
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
            friendsSections = handleUsers(items: items.filter {
                $0.firstName.lowercased().contains(searchText.lowercased())
            })
        } else {
            friendsSections = handleUsers(items: items)
        }
        
        tableView.reloadData()
    }
}

// MARK: Загрузка и сохранение в Realm
extension FriendListViewController {
    
    private func loadUsers() {
        // грузим из realm
        loadFromRealm()
        // запрашиваем с API
        requestFromApi { [weak self] items in
            // сохраняем в realm
            self?.saveToRealm(items: items)
        }
    }
    
    private func requestFromApi(completion: @escaping ([VKUserProtocol]) -> Void) {
        api.getFriends(credential: Session.shared.getCredential()) { [weak self] response in
            switch response {
            case let .success(result):
                if let users = result.response?.items {
                    self?.items = users
                    self?.friendsSections = self?.handleUsers(items: users) ?? []
                    self?.tableView.reloadData()
                } else if
                    let errorCode = result.error?.error_code,
                    let errorMsg = result.error?.error_msg
                {
                    print("❌ #\(errorCode) \(errorMsg)")
                    UserDefaults.standard.isAuthorized = false
                }
            case let .failure(error):
                print("❌ \(error)")
            }
        }
    }
    
    private func saveToRealm(items: [VKUserProtocol]) {
        UserRepository().add(from: items)
    }
    
    private func loadFromRealm() {
        if
            let items = try? UserRepository().getAll(),
            items.count > 0
        {
            friendsSections = handleUsers(items: items)
            tableView.reloadData()
        }
    }
}
