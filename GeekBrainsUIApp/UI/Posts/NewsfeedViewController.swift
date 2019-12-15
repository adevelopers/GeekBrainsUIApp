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
        view.backgroundColor = .white
        let navigationAppereance = navigationItem.standardAppearance
        navigationAppereance?.backgroundColor = .orange
        setupTtile()
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseId)
        tableView.backgroundColor = .white
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseId, for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        
        let model = posts[indexPath.section]
        cell.avatarView.image = UIImage(imageLiteralResourceName: "lena")
        cell.postImageView.image = .postImageList
        cell.authorLabel.text = model.title
        cell.postLabel.text = "Залог хорошего утра для меня --- это спорт, душ и чашечка чая. Готова покорять мир! Желаю вам продуктивной недели и отличного настроения" //model.text

        return cell
    }
    
    
    private func setupTtile() {
        title = "Новости"
    }
}
