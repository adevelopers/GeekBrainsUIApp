//
//  FirendsHistoryCell.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 26.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit


protocol Reusable: class {
    static var reuseId: String { get }
}

extension Reusable {
    static var reuseId: String {
        return "\(type(of: Self.self))"
    }
}


final class HistoryAvatarCell: UICollectionViewCell, Reusable {
    
    let imageView = UIImageView(image: .female)
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubviews([
            imageView,
            nameLabel
        ])
        
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        nameLabel.text = "Алёна Водонаева"
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.font = .primary
        
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.width.height.equalTo(80)
            $0.centerX.equalToSuperview()
            
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}


final class FriendsHistoryCell: UITableViewCell {
    
    static let reuseId = "FriendsHistoryCell"
    
    let separator = SeparatorView()
    let containerView = UIView()
    var fiendsHistoryCollectionView: UICollectionView!
    var items: [User] = User.items
    
    var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 110, height: 130)
        layout.scrollDirection = .horizontal
        return layout
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        fiendsHistoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        addSubviews([
                   separator,
                   containerView
               ])
        
        containerView.addSubview(fiendsHistoryCollectionView)
        
        setupConstraints()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        separator.snp.makeConstraints {
           $0.top.equalToSuperview()
           $0.left.right.equalToSuperview()
           $0.height.equalTo(15)
        }
               
        containerView.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        
        fiendsHistoryCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupCollectionView() {
        
        fiendsHistoryCollectionView.dataSource = self
        fiendsHistoryCollectionView.register(HistoryAvatarCell.self, forCellWithReuseIdentifier: HistoryAvatarCell.reuseId)
        fiendsHistoryCollectionView.backgroundColor = .clear
        fiendsHistoryCollectionView.showsHorizontalScrollIndicator = false
    }
}


extension FriendsHistoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let model = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryAvatarCell.reuseId, for: indexPath)
        return cell
    }
    
    
}

