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
        
        window = UIWindow()
        
        if UserDefaults.standard.isAuthorized {
            let navController = UINavigationController(rootViewController: TabBarController())
            navController.isNavigationBarHidden = true
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        } else {
            window?.rootViewController = UINavigationController(rootViewController: AuthViewController())
            window?.makeKeyAndVisible()
        }
                
        return true
    }

}


// MARK: Realm config
extension AppDelegate {
    private func setupRealm() {
        printRealmPath()
        var config = Realm.Configuration(schemaVersion: 1)
        config.deleteRealmIfMigrationNeeded = true
        Realm.Configuration.defaultConfiguration = config
    }
    
    private func printRealmPath() {
        print("👩🏾‍🎤 Realm path: ", Realm.Configuration.defaultConfiguration.fileURL?.path)
    }
}
