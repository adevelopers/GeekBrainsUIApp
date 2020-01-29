//
//  AppDelegate.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    override init() {
        super.init()
        
        setupRealm()
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        DispatchQueue.main.async {
            if let nav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                nav.pushViewController(AuthViewController(), animated: true)
            }
        }
        
        return true
    }
    
    

}


// MARK: Realm config
extension AppDelegate {
    private func setupRealm() {
        let config = Realm.Configuration(schemaVersion: 2)
        Realm.Configuration.defaultConfiguration = config
    }
}
