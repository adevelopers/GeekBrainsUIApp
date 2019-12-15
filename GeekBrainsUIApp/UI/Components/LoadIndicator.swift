//
//  LoadIndicator.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 15.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class LoadIndicator: UIView {
    
    let circle1 = CAShapeLayer()
    let circle2 = CAShapeLayer()
    let circle3 = CAShapeLayer()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .red
        
        layer.addSublayer(circle1)
        layer.addSublayer(circle2)
        layer.addSublayer(circle3)
        
        circle1.path = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 50, height: 50)).cgPath
        circle1.fillColor = UIColor.blue.cgColor
        
        circle2.path = UIBezierPath(ovalIn: CGRect(x: 60, y: 10, width: 50, height: 50)).cgPath
        circle2.fillColor = UIColor.blue.cgColor
        
        circle3.path = UIBezierPath(ovalIn: CGRect(x: 110, y: 10, width: 50, height: 50)).cgPath
        circle3.fillColor = UIColor.blue.cgColor
        
        
        animateFading(with: circle1, and: 3)
        animateFading(with: circle2, and: 2)
        animateFading(with: circle3, and: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
           
    }
    
    private func animateFading(with layer: CALayer, and duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.autoreverses = true
        
        layer.add(animation, forKey: nil)
    }
    
}
