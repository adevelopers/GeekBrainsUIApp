//
//  AppDelegate.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    override init() {
        super.init()
        
        setupRealm()
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow()
        
        
        
        routeToLogin()
//        if UserDefaults.standard.isAuthorized {
//            let navController = UINavigationController(rootViewController: TabBarController())
//            navController.isNavigationBarHidden = true
//            window?.rootViewController = navController
//            window?.makeKeyAndVisible()
//        } else {
//            window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
//            window?.makeKeyAndVisible()
//        }
                
        return true
    }
    
    private func routeToLogin() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginController = storyboard.instantiateViewController(withIdentifier: "loginViewController")
        window?.rootViewController  = loginController
        window?.makeKeyAndVisible()
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
