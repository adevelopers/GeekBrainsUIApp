//
//  FriendDetailCell.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class FriendDetailCell: UICollectionViewCell {
    @IBOutlet weak var avaterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastVisitLabel: UILabel!
    
    static let reuseId = "FriendDetailCell"
    
    override func prepareForReuse() {
        avaterImageView.image = nil
    }
    
}
