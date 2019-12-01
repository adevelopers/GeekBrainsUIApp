//
//  FriendCell.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


class FriendCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    static let reuseId = "FriendCell"
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        
    }
    
    func setAvatar(with name: String) {
        
        avatarImageView.image = name.isEmpty ? .noPhoto : UIImage(imageLiteralResourceName: name)
    }
}
