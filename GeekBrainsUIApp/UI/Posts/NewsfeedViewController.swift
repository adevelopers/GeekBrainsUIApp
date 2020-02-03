//
//  NewsfeedViewController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 07.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit



enum CellsType {
    case whatsNew
    case friendsHistory
    case post(item: VKPostProtocol)
}


class NewsfeedViewController: UITableViewController {
    
    let api = VKApi()
    
    
    var models: [CellsType] = []
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        //типа поздняя инициализация
        models.append(.whatsNew)
        models.append(.friendsHistory)
//        models.append(contentsOf: getPosts().map { CellsType.post(item: $0) })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let navigationAppereance = navigationItem.standardAppearance
        navigationAppereance?.backgroundColor = .orange
        setupTtile()
        
        tableView.register(WhatsNewCell.self, forCellReuseIdentifier: WhatsNewCell.reuseId)
        tableView.register(FriendsHistoryCell.self, forCellReuseIdentifier: FriendsHistoryCell.reuseId)
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseId)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        loadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        case .whatsNew:
            return 84
        case .friendsHistory:
            return 156
        case .post:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = models[indexPath.row]
        
        switch cellModel {
        case .whatsNew:
            let whatsNewCell = tableView.dequeueReusableCell(withIdentifier: WhatsNewCell.reuseId) as? WhatsNewCell
            return whatsNewCell ?? UITableViewCell()
        case .friendsHistory:
            return tableView.dequeueReusableCell(withIdentifier: FriendsHistoryCell.reuseId) as? FriendsHistoryCell ?? UITableViewCell()
        case let .post(item: post):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseId, for: indexPath) as? PostCell else {
                return UITableViewCell()
            }
            
            cell.avatarView.image = UIImage(imageLiteralResourceName: "lena")
            cell.postImageView.image = .postImageList
            cell.authorLabel.text = "Анфиса А."
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


extension NewsfeedViewController {
    
    private func loadData() {
        VKApi().getWall(Session.shared.getCredential(),
                        wallOwnerId: Session.shared.userId) { response in
                            switch response {
                            case let .success(result):
                                if let items: [CellsType] = result.response?.items.map({ CellsType.post(item: $0) }) {
                                    
                                    items.forEach {
                                        if case let .post(post) = $0 {
                                            if let attachment = post.attachments?.first,
                                                attachment.type == "photo",
                                                let sizes = attachment.photo?.sizes,
                                                let photoLink = sizes.first(where: { $0.type == "x" })?.url
                                            {
                                                print("photo url-> ", photoLink)
                                            } else {
                                                print("post -> ", post.attachments)
                                            }
                                        }
                                    }
                                    
                                    self.models.append(contentsOf: items)
                                    self.tableView.reloadData()
                                }
                            case let .failure(error):
                                print("❌ \(error)")
                            }
                            
        }
    }
}
