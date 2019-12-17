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
    let counterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 25))
    
    var likeCount: Int = 163
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
        
        counterLabel.textColor = .lightGray
        counterLabel.alpha = 0
        likeImageView.tintColor = .like
        counterLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tap)
        
        renderCounter()
    }
    
    @objc
    private func didTap() {
        isLiked = !isLiked
        
        if isLiked {
            likeCount += 1
            likeImageView.image = .like
            animateShowCounter()
        } else {
            likeCount -= 1
            likeImageView.image = .likeOutline
            animateHideCounter()
        }
        
        renderCounter()
    }
    
    private func renderCounter() {
        counterLabel.text = "\(likeCount)"
    }
    
    private func animateShowCounter() {
        counterLabel.frame.origin.x = 0
        UIView.animate(withDuration: 0.5) {
            self.counterLabel.frame.origin.x = 30
            self.counterLabel.alpha = 1
        }
    }
    
    private func animateHideCounter() {
        counterLabel.frame.origin.x = 30
        UIView.animate(withDuration: 0.5) {
            self.counterLabel.frame.origin.x = 0
            self.counterLabel.alpha = 0
        }
    }
    
}
