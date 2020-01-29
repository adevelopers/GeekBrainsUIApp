//
//  AddGroupViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class AddGroupViewController: UITableViewController {
    
    var items: [GroupProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Доступные группы"
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
        
//        cell.avatarImageView.image = item.avatar.isEmpty ? .noPhoto : UIImage(imageLiteralResourceName: item.avatar)
//        cell.nameLabel.text = item.name
//        cell.desciptionLabel.text = item.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GroupCell.height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGroup = items[indexPath.row]
        let groupsController = navigationController?.children.first { $0 is GroupsListViewController } as? GroupsListViewController
//        groupsController?.items.append(Section(title: <#T##String#>, items: <#T##[_]#>))
        groupsController?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}
