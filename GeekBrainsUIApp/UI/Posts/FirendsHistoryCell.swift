//
//  FirendsHistoryCell.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 26.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit



final class FriendsHistoryCell: UITableViewCell {
    
    static let reuseId = "FriendsHistoryCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

