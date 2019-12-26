//
//  SearchCell.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 26.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit



final class SearchCell: UITableViewCell {
    
    static let reuseId = "SearchCell"
    
    let avatarView = AvatarView()
    let searchField = UISearchBar()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .red
        
        addSubviews([
            avatarView,
            searchField
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
