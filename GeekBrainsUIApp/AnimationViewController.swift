//
//  AnimationViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 04.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


class AnimationViewController: UIViewController {
    
    let mill = UIImageView(image: .mill)
    let wings = UIImageView(image: .wings)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            view.addSubview(mill)
            view.addSubview(wings)
            
            mill.center = view.center
            wings.center = view.center
            wings.center.y -= 90
            wings.center.x -= 10
               
        
            let duration: TimeInterval = 20
            wings.rotate(duration: duration)
        }

}

extension UIView {
    
    func rotate(duration: Double = 1) {
        let keyFrameName = "мой-поворот"
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0.0
        animation.toValue = Float.pi * 2.0
        animation.duration = duration
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: keyFrameName)
    }

}
