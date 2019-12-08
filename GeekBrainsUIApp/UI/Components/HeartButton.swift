//
//  HeartButton.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 06.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class HeartButton: UIButton {
    
    var strokeColor: UIColor = .lightGray
    var selectedColor: UIColor = .systemRed
    
    private var strokeWidth: CGFloat = 2.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let bezierPath = UIBezierPath(heartIn: bounds)
        
        if isSelected {
            bezierPath.lineWidth = strokeWidth
            selectedColor.setStroke()
            bezierPath.stroke()
            selectedColor.setFill()
            bezierPath.fill()
        } else {
            bezierPath.lineWidth = strokeWidth
            strokeColor.setStroke()
            bezierPath.stroke()
        }
        
    }
    
}
