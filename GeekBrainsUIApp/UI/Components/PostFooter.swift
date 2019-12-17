//
//  PostFooter.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 13.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class PostFooter: UIView {
    
    let likeView = LikeButton()
    let commentsButton = UIImageView(image: .comment)
    let shareButton = UIImageView(image: .share)
    let viewsCounter = ViewsCounterView(frame: .zero)
    let containerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {        
        likeView.contentMode = .scaleAspectFit
        shareButton.contentMode = .scaleAspectFit
        commentsButton.contentMode = .scaleAspectFit
        
        containerStackView.spacing = 32
        containerStackView.distribution = .fillEqually
        containerStackView.axis = .horizontal
        
        containerStackView.addArrangedSubview(likeView)
        containerStackView.addArrangedSubview(commentsButton)
        containerStackView.addArrangedSubview(shareButton)
        containerStackView.addArrangedSubview(viewsCounter)
        
        addSubview(containerStackView)
        
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            containerStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            containerStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

