//
//  AnimatedTransitioning.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 23.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class AnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            source.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: -source.view.frame.height / 2)
            destination.view.alpha = 1
        }, completion: { _ in
            destination.view.transform = .identity
            source.view.transform = .identity
            transitionContext.completeTransition(true)
        })
        
    }
    
}

