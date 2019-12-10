//
//  MessagesViewController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 10.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class MessagesViewController: UITableViewController {

    var messages = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: MessageCell.reuseId, bundle: nil), forCellReuseIdentifier: MessageCell.reuseId)
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.reuseId, for: indexPath) as? MessageCell else {
            return UITableViewCell()
        }
        
        
        return cell
    }

    
    
}
