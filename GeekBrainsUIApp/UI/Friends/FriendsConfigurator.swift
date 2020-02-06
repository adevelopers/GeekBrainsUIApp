//
//  FriendsConfigurator.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 06.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import UIKit


protocol FriendsConfigurator {
    func configure(view: FriendListViewController)
}

class FriendsConfiguratorImpl: FriendsConfigurator {
    func configure(view: FriendListViewController) {
        view.presenter = FriendsPresenterImpl(repository: UserRepository(), view: view)
    }
}
