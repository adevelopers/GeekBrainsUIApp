//
//  LikeView.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 05.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


class LikeView: UIControl {
    
    var count: Int = Int.random(in: 0...134)
    var normalColor = UIColor.lightGray
    var selectedColor = UIColor.red
    
    private let heartButton = HeartButton()
    private let likeCountLabel = UILabel(frame: CGRect(origin: .zero,
                                                       size: CGSize(width: 50, height: 20)))
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        heartButton.selectedColor = selectedColor
        heartButton.strokeColor = normalColor
        heartButton.backgroundColor = .clear
        likeCountLabel.textAlignment = .left
        likeCountLabel.textColor = normalColor
        likeCountLabel.font = UIFont.systemFont(ofSize: 12)
        likeCountLabel.text = "\(count)"
        addSubview(heartButton)
        addSubview(likeCountLabel)
        
        heartButton.addTarget(self,
                              action: #selector(didTapHeart),
                              for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let heartSide: CGFloat = 18
        heartButton.frame = CGRect(origin: .zero, size: CGSize(width: heartSide, height: heartSide * 0.8))
        likeCountLabel.frame = CGRect(origin: .zero, size: CGSize(width: bounds.width * 0.5, height: bounds.height))
        heartButton.center = CGPoint(x: 8, y: bounds.height / 2)
        likeCountLabel.center = CGPoint(x: heartButton.bounds.width + 16, y: bounds.height / 2)
    }
    
    @objc
    private func didTapHeart() {
        if heartButton.isSelected {
            likeCountLabel.textColor = normalColor
            heartButton.isSelected = false
            count -= 1
        } else {
            heartButton.isSelected = true
            likeCountLabel.textColor = selectedColor
            count += 1
        }
        
        likeCountLabel.text = "\(count)"
    }
    
}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}

extension UIBezierPath {
    convenience init(heartIn rect: CGRect) {
        self.init()
        
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne * sideOne + sideTwo * sideTwo) / 2
        
        addArc(withCenter: CGPoint(x: rect.width * 0.3,
                                   y: rect.height * 0.35),
               radius: arcRadius,
               startAngle: 135.degreesToRadians,
               endAngle: 315.degreesToRadians,
               clockwise: true)
        
        addLine(to: CGPoint(x: rect.width / 2,
                            y: rect.height * 0.2))
        
        addArc(withCenter: CGPoint(x: rect.width * 0.7,
                                   y: rect.height * 0.35),
               radius: arcRadius,
               startAngle: 225.degreesToRadians,
               endAngle: 45.degreesToRadians,
               clockwise: true)
        
        addLine(to: CGPoint(x: rect.width * 0.5,
                            y: rect.height * 0.95))
        
        close()
    }
}
