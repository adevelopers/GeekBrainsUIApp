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

        Session.shared.token = "13DBF900IDDQD"
        Session.shared.userId = 2098109
        
        print("❇️ token: \(Session.shared.token)")
        print("🌐 userID: \(Session.shared.userId)")
        
        return true
    }

}

