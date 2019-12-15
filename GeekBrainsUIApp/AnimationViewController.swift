//
//  AnimationViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 02.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

extension UIView {
    func moveX(_ x: CGFloat) {
        center.x += x
    }
    
    func moveY(_ y: CGFloat) {
        center.y += y
    }
    
    func moveXY(_ point: CGPoint) {
        center.y += point.y
        center.x += point.x
    }
}

class AnimationViewController: UIViewController {
    @IBOutlet weak var animateButton: UIButton!
    @IBAction func didTapAnimate(_ sender: Any) {
       let animation = CAKeyframeAnimation()
       animation.keyPath = "position"

       let path = UIBezierPath(ovalIn: CGRect(x: sun.center.x - 25, y: sun.center.y - 25, width: 50, height: 50)).cgPath
       print(path.isEmpty)
        
        
       animation.path = path
       animation.fillMode = .both
       animation.rotationMode = .none
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
       animation.duration = 2
       animation.repeatCount = .infinity
        animation.speed = 1
    animation.isRemovedOnCompletion = false
       
        
       sun.layer.add(animation, forKey: nil)
       sun.layer.shadowPath = path
       sun.layer.shadowColor = UIColor.green.cgColor
    sun.layer.shadowOpacity = 1
        sun.layer.shadowOffset = .zero
        sun.layer.shadowRadius = 10
        
        
    }
    
    
    let ground = UIImageView(image: .ground)
    let sun = UIImageView(image: .sun)
    let trees = UIImageView(image: .trees)
    let tree1 = UIImageView(image: .tree1)
    let tree2 = UIImageView(image: .tree2)
    let tree3 = UIImageView(image: .tree3)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(sun)
        
        let l = CAShapeLayer()
        l.path = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 0.1, height: 0.1)).cgPath
        l.cornerRadius = 20
        l.contents = UIImage.sun.cgImage
        l.fillColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1) .cgColor
        l.shadowColor = UIColor.green.cgColor
        l.shadowRadius = 50
        l.shadowPath = UIBezierPath(ovalIn: CGRect(x: -50, y: 0, width: 100, height: 100)).cgPath
        l.shadowOpacity = 0.5
        l.shadowOffset = .zero
        l.position = view.center
        l.rasterizationScale = UIScreen.main.scale
        l.shouldRasterize = true
        
        initialState()
        
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = sun.center.y - 100
        animation.toValue = sun.center.y + 100
        animation.duration = 6
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        
        l.add(animation, forKey: nil)
        
        view.layer.addSublayer(l)
        
        
        sun.accessibilityLabel = "Sun"
        ground.accessibilityLabel = "Ground"
        trees.accessibilityLabel = "Forest"
        tree1.accessibilityLabel = "Tree1"
        tree2.accessibilityLabel = "Tree2"
        tree3.accessibilityLabel = "Tree3"

        
    }
    
    private func initialState() {
        [sun].forEach {
            $0.center = view.center
        }
        
        self.sun.moveY(150)
        view.sendSubviewToBack(sun)
        sun.transform = CGAffineTransform.identity
        
    }

}
