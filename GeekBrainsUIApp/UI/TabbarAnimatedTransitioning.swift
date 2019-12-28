//
//  TabbarAnimatedTransitioning.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 20.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


class TabbarAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    enum AnimationDriection {
        case left
        case right
    }
    
    var animationDirection: AnimationDriection = .right
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        destination.view.frame = source.view.frame
        let backView = UIView()
        backView.backgroundColor = .white
        backView.frame = destination.view.frame
        transitionContext.containerView.addSubview(backView)
        transitionContext.containerView.addSubview(destination.view)
        
        switch animationDirection {
        case .left:
            destination.view.transform = CGAffineTransform(translationX: -source.view.frame.width, y: 0)
            backView.transform = CGAffineTransform(translationX: -source.view.frame.width, y: 0)
            
            UIView.animate(withDuration: 0.3, animations: {
                source.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
                destination.view.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { _ in
                destination.view.transform = .identity
                source.view.transform = .identity
                backView.transform = .identity
                transitionContext.completeTransition(true)
            })
        case .right:
            destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
            backView.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
            UIView.animate(withDuration: 0.3, animations: {
                source.view.transform = CGAffineTransform(translationX: -source.view.frame.width, y: 0)
                destination.view.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { _ in
                destination.view.transform = .identity
                source.view.transform = .identity
                backView.transform = .identity
                transitionContext.completeTransition(true)
            })
        }
    }
    
}
