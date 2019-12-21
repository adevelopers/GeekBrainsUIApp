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
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let navigationAppereance = navigationItem.standardAppearance
        navigationAppereance?.backgroundColor = .orange
        setupTtile()
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseId)
        tableView.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatedPresent()
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


extension NewsfeedViewController: AnimatedPresentable {
    
    func animatedPresent() {
        view.backgroundColor = .white
        tableView.transform = .init(scaleX: 0, y: 0)
        UIView.animate(withDuration: 2, delay: 2,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.7,
                       options: [], animations: {
            self.tableView.transform = .init(scaleX: 1, y: 1)
        }, completion: { _ in
//            self.tableView.transform = .identity
        })
    }

}

protocol AnimatedPresentable {
    func animatedPresent()
}
