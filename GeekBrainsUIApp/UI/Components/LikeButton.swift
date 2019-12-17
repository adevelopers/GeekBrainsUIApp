//
//  LikeButton.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 15.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class LikeButton: UIControl {
    
    let likeImageView = UIImageView(image: .likeOutline)
    let counterLabel = UILabel()
    
    var likeCount: Int = 0
    var isLiked: Bool = false
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(likeImageView)
        addSubview(counterLabel)
        
        likeImageView.tintColor = .like
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tap)
    }
    
    @objc
    private func didTap() {
        print("tap")
        isLiked = !isLiked
        
        if isLiked {
            likeImageView.image = .like
        } else {
            likeImageView.image = .likeOutline
        }
    }
    
}
