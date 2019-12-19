//
//  Avatar.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 04.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class AvatarView: UIView {

    @IBInspectable var side: CGFloat = 30
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var image: UIImage = .noPhoto
    
    private let avatarImageView = UIImageView(image: .noPhoto)
    private let shadowView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(avatarImageView)
        setupAvatarImageView()
        setupShadow()
     
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    private func setupAvatarImageView() {
        avatarImageView.accessibilityLabel = "avatarImageView"
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.image = image
        avatarImageView.frame = CGRect(origin: .zero,
                                       size: CGSize(width: side, height: side))
        avatarImageView.layer.cornerRadius = side / 2
        avatarImageView.layer.masksToBounds = true
        avatarImageView.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
    }
    
    private func setupShadow() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    @objc
    private func didTap() {
        isUserInteractionEnabled = false
        layer.removeAllAnimations()
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
              self.isUserInteractionEnabled = true
        }
        
        let squeezeAnimation = CABasicAnimation()
        squeezeAnimation.keyPath = "transform.scale"
        squeezeAnimation.duration = 0.3
        squeezeAnimation.fromValue = 1
        squeezeAnimation.toValue = 0.7
        
        let restoreAnimation = CASpringAnimation()
        restoreAnimation.keyPath = "transform.scale"
        restoreAnimation.fromValue = 0.7
        restoreAnimation.toValue = 1
        restoreAnimation.duration = 1.3
        restoreAnimation.damping = 3
        restoreAnimation.initialVelocity = 1
        
        let tapAnimation = CAAnimationGroup()
        tapAnimation.animations = [squeezeAnimation, restoreAnimation]
        tapAnimation.duration = 1.6
        layer.add(tapAnimation, forKey: nil)
        CATransaction.commit()
        
    }
}
