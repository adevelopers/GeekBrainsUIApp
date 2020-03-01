//
//  TabsConfigurator.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 06.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
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
        .init(title: "Posts", icon: .tabNewsfeed,
              initType: .direct(controller: UINavigationController(rootViewController:
                    PostsViewController(presenter: PostsPresenterImp())
                )
            )),
        .init(title: "Friends", icon: .tabSearch, initType: .storyboard(id: .friendsNavigation)),
        .init(title: "Groups", icon: .tabMessages, initType: .storyboard(id: .groupsNavigation)),
        .init(title: "More", icon: .tabMore,
              initType: .direct(controller: UINavigationController(rootViewController: MoreViewController()))),
    ]
    
    func configured() -> [UIViewController] {
        
        return tabs.enumerated().map { item in
            let tab = item.element
            switch tab.initType {
            case let .storyboard(id: controllerId):
                // елси контроллер в Storyboard
                let controller = createConfiguredController(controllerId: controllerId)
                controller.tabBarItem = UITabBarItem(title: tab.title, image: tab.icon, tag: item.offset)
                return controller
            case let .direct(controller: controller):
                controller.tabBarItem = UITabBarItem(title: tab.title, image: tab.icon, tag: item.offset)
                return controller
            }
        }
    }
    
}

extension TabsConfigurator {
    private func createConfiguredController(controllerId: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: controllerId)
        
        switch controllerId { // если можем, то конфигурим контроллер
        case .friendsNavigation:
            if
                let navigationController = controller as? UINavigationController,
                let friendsController = navigationController.viewControllers.first as? FriendListViewController
            {
                friendsController.configurator = FriendsConfiguratorImpl()
            }
        default:
            break
        }
        
        return controller
    }
}
