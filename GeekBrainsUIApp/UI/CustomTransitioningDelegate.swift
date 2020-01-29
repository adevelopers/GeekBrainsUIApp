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
        return trnsitioning
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return trnsitioning
    }
    
    
    
}
