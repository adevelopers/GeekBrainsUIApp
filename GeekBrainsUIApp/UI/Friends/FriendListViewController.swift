//
//  FriendListViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class FriendListViewController: UITableViewController {

    let alphabetControl = AlphabetControl(frame: CGRect(x: 0, y: 0, width: 40, height: 300))
    
    var items = User.items
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.view.addSubview(alphabetControl)
        alphabetControl.list = Set(items.map { "\($0.firstName.first ?? Character(""))" }).sorted()
        alphabetControl.frame = view.bounds
        alphabetControl.frame.size = CGSize(width: 50, height: view.frame.height * 0.3)
        alphabetControl.center = CGPoint(x: view.bounds.width - 25,
                                         y: view.center.y)
        
        alphabetControl.rx_subscribe(onNext: { selectedLetter in
            print("Выбрана буква -> ", selectedLetter)
            // проскролить до ближайшего пользователя имя которого начинается с letter
//            tableView.scr
        })
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

