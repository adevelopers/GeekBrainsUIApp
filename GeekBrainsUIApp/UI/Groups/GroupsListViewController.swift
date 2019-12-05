//
//  GroupsListViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class GroupsListViewController: UITableViewController {

    var items = Group.items.filter { $0.isInGroup }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = false

        
        tableView.register(UINib(nibName: GroupCell.reuseId, bundle: nil), forCellReuseIdentifier: GroupCell.reuseId)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseId, for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        
        cell.avatarImageView.image = item.avatar.isEmpty ? .noPhoto : UIImage(imageLiteralResourceName: item.avatar)
        cell.nameLabel.text = item.name
        cell.desciptionLabel.text = item.description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let segueId = segue.identifier,
            segueId == "addGroupSegue",
            let addGroupViewController = segue.destination as? AddGroupViewController
        {
            let availiableGroups = Set(Group.items).subtracting(items)
            addGroupViewController.items = Array(availiableGroups)
        }
    }
    
}
