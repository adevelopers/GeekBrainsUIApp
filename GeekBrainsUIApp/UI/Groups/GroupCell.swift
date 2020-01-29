//
//  GroupCell.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import Kingfisher


enum GroupCellModel {
    case decoded(VKGroupProtocol)
    case realm(VKGroupProtocol)
}

class GroupCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var desciptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    static let reuseId = "GroupCell"
    static let height: CGFloat = 100
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.image = .noPhoto
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension GroupCell {
    func configure(with model: GroupCellModel) {
        if case let .realm(group) = model {
            nameLabel.text = group.name
            desciptionLabel.text = group.text
            if let imageUrl = URL(string: group.photo200) {
                avatarImageView.kf.setImage(with: imageUrl)
            }
        }
        
        if case let .decoded(group) = model {
            nameLabel.text = group.name
            desciptionLabel.text = group.text
            if let imageUrl = URL(string: group.photo200) {
                avatarImageView.kf.setImage(with: imageUrl)
            }
        }
    }
}
