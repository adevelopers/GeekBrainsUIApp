//
//  AppDelegate.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

<<<<<<< Updated upstream
=======
        
        DispatchQueue.main.async {
            if let nav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                nav.pushViewController(AuthViewController(), animated: true)
            }
        }
>>>>>>> Stashed changes
        
        return true
    }

}

