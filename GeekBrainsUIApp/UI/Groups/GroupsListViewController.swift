//
//  GroupsListViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

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
        let credential = Credential(token: session.token, userId: session.userId)
        api.getGroups(credential) { [weak self] response in
            switch response {
            case let .success(models):
                if let items = models.response?.items {
                    print("👥 groups: ", models)
                    self?.sections.append(Section(title: "Группы", items: items))
                    self?.tableView.reloadData()
                }
            case let .failure(error):
                print("❌ \(error)")
            }
        }
        
    }
}
