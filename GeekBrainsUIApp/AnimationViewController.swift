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
        initialState()
        UIView.animate(withDuration: 0.4) {
            self.tree1.moveY(-200)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.tree3.moveY(-200)
        }
        
        UIView.animate(withDuration: 0.6) {
            self.tree2.moveY(-200)
        }
        
        UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [.curveLinear], animations: {
               self.sun.moveXY(CGPoint(x: -50, y: -250))
        },completion: { _ in
            
            self.view.bringSubviewToFront(self.sun)
            UIView.animate(withDuration: 0.8) {
                self.sun.transform = CGAffineTransform.init(scaleX: 130, y: 130)
            }
            self.view.bringSubviewToFront(self.animateButton)
        })
        
        UIView.animate(withDuration: 1, delay: 0.65, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.6, options: [.curveEaseInOut], animations: {
            self.trees.moveY( -150)
        }, completion: nil)
        
    }
    
    
    let ground = UIImageView(image: .ground)
    let sun = UIImageView(image: .sun)
    let trees = UIImageView(image: .trees)
    let tree1 = UIImageView(image: .tree1)
    let tree2 = UIImageView(image: .tree2)
    let tree3 = UIImageView(image: .tree3)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(sun)
        view.addSubview(trees)
        view.addSubview(tree1)
        view.addSubview(tree2)
        view.addSubview(tree3)
        view.addSubview(ground)
        
        sun.accessibilityLabel = "Sun"
        ground.accessibilityLabel = "Ground"
        trees.accessibilityLabel = "Forest"
        tree1.accessibilityLabel = "Tree1"
        tree2.accessibilityLabel = "Tree2"
        tree3.accessibilityLabel = "Tree3"

        
        initialState()
        
        
        
    }
    
    private func initialState() {
        [ground, trees, tree1,tree2, tree3, sun].forEach {
            $0.center = view.center
        }
        
        [tree1,tree2, tree3].forEach {
            $0.frame.origin.y = ground.frame.origin.y - $0.frame.height
            $0.frame.origin.y += 170
            $0.moveY(200)
        }
        
        tree1.moveX(-70)
        tree2.moveX(-20)
        tree3.moveX(20)
        self.sun.moveY(150)
        view.sendSubviewToBack(sun)
        sun.transform = CGAffineTransform.identity
        trees.moveY(150)
        ground.moveY(164)
        
    }

}
