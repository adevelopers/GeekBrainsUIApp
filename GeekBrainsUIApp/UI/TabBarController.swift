//
//   TabBarController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 20.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class TabBarController: UITabBarController {
    let transitioning = TabbarAnimatedTransitioning()
    var previousIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
    }
}


extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          animationControllerForTransitionFrom fromVC: UIViewController,
                          to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard
            let was = viewControllers?.firstIndex(of: fromVC),
            let will = viewControllers?.firstIndex(of: toVC)
        else {
            return nil
        }
        
        if was > will {
            transitioning.animationDirection = .left
        } else {
            transitioning.animationDirection = .right
        }
        
        previousIndex = will
        return transitioning
    }
}
