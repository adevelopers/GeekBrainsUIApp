//
//  FriendListViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class FriendListViewController: UITableViewController {

    var items = User.items

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let segueId = segue.identifier,
            segueId == "friendDetailSegue",
            let friendViewController = segue.destination as? FriendViewController,
            let selectedIndex = tableView.indexPathForSelectedRow
        {
            friendViewController.model = items[selectedIndex.row]
        }
    }
    

    // MARK: DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseId, for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        let model = items[indexPath.row]
        cell.nameLabel.text = model.name
        cell.locationLabel.text = model.location
        cell.setAvatar(with: model.avatar)
        return cell
    }

}

