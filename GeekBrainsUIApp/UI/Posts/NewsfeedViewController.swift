//
//  NewsfeedViewController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 07.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


enum CellsType {
    case searchBar
    case friendsHistory
    case post(item: Post)
}
    

class NewsfeedViewController: UITableViewController {
    
    var models: [CellsType] = []
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        //типа поздняя инициализация
        models.append(.searchBar)
        models.append(.friendsHistory)
        models.append(contentsOf: getPosts().map { CellsType.post(item: $0) })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let navigationAppereance = navigationItem.standardAppearance
        navigationAppereance?.backgroundColor = .orange
        setupTtile()
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reuseId)
        tableView.register(FriendsHistoryCell.self, forCellReuseIdentifier: FriendsHistoryCell.reuseId)
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
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellModel = models[indexPath.row]
        
        switch cellModel {
        case .searchBar:
            return 30
        case .friendsHistory:
            return 60
        case .post:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = models[indexPath.row]
        
        switch cellModel {
        case .searchBar:
            let searchCell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseId) as? SearchCell
            return searchCell ?? UITableViewCell()
        case .friendsHistory:
            return tableView.dequeueReusableCell(withIdentifier: FriendsHistoryCell.reuseId) as? FriendsHistoryCell ?? UITableViewCell()
        case let .post(item: post):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseId, for: indexPath) as? PostCell else {
                return UITableViewCell()
            }
            
            cell.avatarView.image = UIImage(imageLiteralResourceName: "lena")
            cell.postImageView.image = .postImageList
            cell.authorLabel.text = post.title
            cell.postLabel.text = post.text
            return cell
        }
        
    }
    
    private func setupTtile() {
        title = "Новости"
    }
    
    private func getPosts() -> [Post] {
        // тут как буд-то мы из сети получили список новостей
        return Post.generateDemoPosts(with: 34)
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
