//
//  HeartButton.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 06.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class HeartButton: UIButton {
    
    private var strokeWidth: CGFloat = 2.0
    private var strokeColor: UIColor = .lightGray
        
    override func draw(_ rect: CGRect) {
        super.draw(rect)
           
        let bezierPath = UIBezierPath(heartIn: bounds)
        strokeColor.setStroke()
        bezierPath.lineWidth = strokeWidth
        bezierPath.stroke()
        if isSelected {
           strokeColor.setFill()
           bezierPath.fill()
        }
    }

}
