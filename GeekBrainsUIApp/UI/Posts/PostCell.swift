//
//  PostCell.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 07.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    let topSeparator = UIView()
    let avatarView = AvatarView()
    let authorLabel = UILabel()
    let dateLabel = UILabel()
    let verifiedIcon = UIImageView(image: .verified)
    let moreButton = UIButton()
    let postLabel = UILabel()
    let postImageView = UIImageView(image: .postImage)
    let postFooter = PostFooter()
    
    static let reuseId = "PostCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        topSeparator.backgroundColor = .lightyGray
        authorLabel.textColor = .author
        dateLabel.text = "18 ноя в 11:33"
        dateLabel.textColor = .lightGray
        
        postLabel.backgroundColor = .white
        postLabel.numberOfLines = 0
        
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        moreButton.setImage(.more, for: .normal)
        
        addSubviews([
            topSeparator,
            avatarView,
            authorLabel,
            dateLabel,
            verifiedIcon,
            moreButton,
            postLabel,
            postImageView,
            postFooter
        ])
        
        topSeparator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topSeparator.topAnchor.constraint(equalTo: topAnchor),
            topSeparator.leftAnchor.constraint(equalTo: leftAnchor),
            topSeparator.rightAnchor.constraint(equalTo: rightAnchor),
            topSeparator.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: topSeparator.bottomAnchor, constant: 8),
            avatarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            avatarView.heightAnchor.constraint(equalToConstant: 40),
            avatarView.widthAnchor.constraint(equalToConstant: 40),
        ])

        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorLabel.bottomAnchor.constraint(equalTo: avatarView.centerYAnchor, constant: 4),
            authorLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 8),
            authorLabel.rightAnchor.constraint(equalTo: verifiedIcon.leftAnchor, constant: 8)
        ])
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: avatarView.centerYAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: 16)
        ])
        
        verifiedIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verifiedIcon.centerYAnchor.constraint(equalTo: authorLabel.centerYAnchor),
            verifiedIcon.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: 32)
        ])
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: topSeparator.bottomAnchor, constant: 8),
            moreButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -11),
        ])
        
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 14),
            postLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            postLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
        
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            postImageView.bottomAnchor.constraint(equalTo: postFooter.topAnchor, constant: -8)
        ])
        
        postFooter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postFooter.leftAnchor.constraint(equalTo: leftAnchor),
            postFooter.rightAnchor.constraint(equalTo: rightAnchor),
            postFooter.heightAnchor.constraint(equalToConstant: 40),
            postFooter.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
