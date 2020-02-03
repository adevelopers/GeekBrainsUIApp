//
//   TabBarController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 20.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

extension String {
    static let loginViewController = "loginViewController"
    static let postsNavigation = "postsNavigation"
    static let friendsNavigation = "friendsNavigation"
    static let groupsNavigation = "groupsNavigation"
    static let photosNavigation = "photosNavigation"
    
}

protocol TabConfigurable {
    func configured() -> [UIViewController]
}

final class TabsConfigurator: TabConfigurable {
    
    struct TabConfig {
        let title: String
        let icon: UIImage
        let controllerId: String
    }
    
    var tabs: [TabConfig] = [
        .init(title: "Posts", icon: .tabNewsfeed, controllerId: .postsNavigation),
        .init(title: "Search", icon: .tabSearch, controllerId: .friendsNavigation),
        .init(title: "Messages", icon: .tabMessages, controllerId: .groupsNavigation),
        .init(title: "More", icon: .tabMore, controllerId: .photosNavigation),
    ]
    
    func configured() -> [UIViewController] {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return tabs.enumerated().map { item in
            let tab = item.element
            let controller = storyboard.instantiateViewController(identifier: tab.controllerId)
            controller.tabBarItem = UITabBarItem(title: tab.title, image: tab.icon, tag: item.offset)
            return controller
        }
    }
    
}

final class TabBarController: UITabBarController {
    let transitioning = TabbarAnimatedTransitioning()
    var previousIndex = 0
    
    let configurator = TabsConfigurator()
    
    override func loadView() {
        super.loadView()
        navigationController?.isNavigationBarHidden = true
        setViewControllers(configurator.configured(), animated: false)
    }
    
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
