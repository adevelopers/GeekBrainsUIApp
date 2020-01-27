//
//  UserDefaults + ext.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 20.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation


extension UserDefaults {
    var isAuthorized: Bool {
       get { return bool(forKey: #function) }
       set { set(newValue, forKey: #function) }
    }
}
