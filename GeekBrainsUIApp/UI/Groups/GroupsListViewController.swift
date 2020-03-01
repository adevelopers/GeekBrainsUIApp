//
//  GroupsListViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import VkApiCore
import VkApiKit

class GroupsListViewController: UITableViewController {

    let session = Session.shared
    let api: VKApiProtocol = VKApi()
    
    var sections: [Section<VKGroupProtocol>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = false

        tableView.register(UINib(nibName: GroupCell.reuseId, bundle: nil), forCellReuseIdentifier: GroupCell.reuseId)
        
        loadData()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseId, for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        
        let model: VKGroupProtocol = sections[indexPath.section].items[indexPath.row]
        cell.configure(with: .decoded(model))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GroupCell.height
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            sections[indexPath.section].items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if
//            let segueId = segue.identifier,
//            segueId == "addGroupSegue",
//            let addGroupViewController = segue.destination as? AddGroupViewController
//        {
//            let availiableGroups = Set(Group.items).subtracting(items)
//            addGroupViewController.items = Array(availiableGroups)
//        }
    }
    
    
    // MARK: Data
    private func loadData() {
        // грузим из realm
        loadFromRealm()
        // запрашиваем с API
        requestFromApi { [weak self] items in
            print("👥 groups: ", items)
            // сохраняем в realm
            self?.saveToRealm(items: items)
        }
    }
    
    private func saveToRealm(items: [VKGroupProtocol]) {
        GroupRepository().add(from: items)
    }
    
    private func requestFromApi(completion: @escaping ([VKGroupProtocol]) -> Void) {
        let credential = Credential(token: session.token, userId: session.userId)
        api.getGroups(credential) { response in
            switch response {
            case let .success(models):
                if let items = models.response?.items {
                    completion(items)
                } else if
                    let errorCode = models.error?.error_code,
                    let errorMsg = models.error?.error_msg
                {
                    print("❌ #\(errorCode) \(errorMsg)")
                    UserDefaults.standard.isAuthorized = false
                }
            case let .failure(error):
                print("❌ \(error)")
            }
        }
    }
    
    private func loadFromRealm() {
        if
            let items = try? GroupRepository().getAll(),
            items.count > 0
        {
            sections.append(Section(title: "Группы", items: items))
            tableView.reloadData()
        }
    }
}
