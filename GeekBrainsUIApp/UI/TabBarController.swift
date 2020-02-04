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
    
    enum ControllerInitialType {
        case storyboard(id: String)
        case direct(controller: UIViewController)
    }
    
    struct TabConfig {
        let title: String
        let icon: UIImage
        let initType: ControllerInitialType
    }
    
    var tabs: [TabConfig] = [
        .init(title: "Posts", icon: .tabNewsfeed, initType: .storyboard(id: .postsNavigation) ),
        .init(title: "Search", icon: .tabSearch, initType: .storyboard(id: .friendsNavigation)),
        .init(title: "Messages", icon: .tabMessages, initType: .storyboard(id: .groupsNavigation)),
        .init(title: "More", icon: .tabMore,
              initType: .direct(controller: UINavigationController(rootViewController: MoreViewController()))),
    ]
    
    func configured() -> [UIViewController] {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return tabs.enumerated().map { item in
            let tab = item.element
            switch tab.initType {
            case let .storyboard(id: controllerId):
                // елси контроллер в Storyboard
                let controller = storyboard.instantiateViewController(identifier: controllerId)
                controller.tabBarItem = UITabBarItem(title: tab.title, image: tab.icon, tag: item.offset)
                return controller
            case let .direct(controller: controller):
                controller.tabBarItem = UITabBarItem(title: tab.title, image: tab.icon, tag: item.offset)
                return controller
            }
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
