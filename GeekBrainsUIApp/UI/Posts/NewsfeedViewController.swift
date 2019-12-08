//
//  NewsfeedViewController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 07.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


class NewsfeedViewController: UITableViewController {
    
    let posts: [Post] = Post.generateDemoPosts(with: 34)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        let navigationAppereance = navigationItem.standardAppearance
        navigationAppereance?.backgroundColor = .orange
        setupTtile()
        tableView.register(UINib(nibName: PostCell.reuseId, bundle: nil), forCellReuseIdentifier: PostCell.reuseId)
        tableView.backgroundColor = .lightGray
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 278
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseId, for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        
        let model = posts[indexPath.section]
        cell.postImageView.image = .postImage
        cell.postImageView.contentMode = .topLeft
        cell.titleLabel.text = model.title
        cell.postLabel.text = model.text

        return cell
    }
    
    
    private func setupTtile() {
        title = "Новости"
    }
}
