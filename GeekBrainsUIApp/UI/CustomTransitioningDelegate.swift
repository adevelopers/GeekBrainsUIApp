//
//  CustomTransitioningDelegate.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 17.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


class CustomTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    let trnsitioning = AnimatedTransitioning()
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("TRY TRA 3")
        return trnsitioning
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("TRY TRA 1")
        return trnsitioning
    }
    
    
    
}


class AnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("TRY TRA")
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
//        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
        destination.view.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            source.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: -source.view.frame.height / 2)
//            destination.view.transform = CGAffineTransform(translationX: 0, y: 0)
            destination.view.alpha = 1
        }, completion: { _ in
            destination.view.transform = .identity
            source.view.transform = .identity
            transitionContext.completeTransition(true)
        })
        
    }
    
}
