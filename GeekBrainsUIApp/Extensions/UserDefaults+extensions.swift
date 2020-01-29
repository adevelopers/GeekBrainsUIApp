//
//  UserDefaults+extensions.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 29.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation


extension UserDefaults {
    var isAuthorized: Bool {
        get { return bool(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    // TODO: Вынести в KeyChain
    var token: String? {
        get { return string(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var userId: Int {
        get { return integer(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
}
