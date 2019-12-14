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
        print(frame)
        print("layoutSubviews")
        
        setupUI()
    }
    
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(avatarImageView)
        setupAvatarImageView()
        setupShadow()
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
}
