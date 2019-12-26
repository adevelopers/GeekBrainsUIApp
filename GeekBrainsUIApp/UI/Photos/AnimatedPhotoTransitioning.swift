//
//  AnimatedPhotoTransitioning.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 23.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class AnimatedPhotoTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from) as? PhotosViewController,
            let destination = transitionContext.viewController(forKey: .to)
        else { return }
               
        let photoView = source.selectedView!
        transitionContext.containerView.addSubview(photoView)
            
        destination.view.frame = source.view.frame
        
        let orifinCenter = photoView.center
        
        
                
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.calculationModeCubic, .layoutSubviews], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                photoView.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                                           y:  UIScreen.main.bounds.height / 2)
                photoView.contentMode = .scaleAspectFill
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.5, animations: {
                photoView.frame = UIScreen.main.bounds
            })
            
            
            
            
        }, completion: { isCompleted in
            transitionContext.containerView.addSubview(destination.view)
            photoView.center = orifinCenter
            transitionContext.completeTransition(true)
        })
        
               
    }
    
}
