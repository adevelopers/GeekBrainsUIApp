//
//  Session.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 13.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation

final class Session {
    static let shared = Session()
    
    var token: String = "" { // – для хранения токена в VK,
        didSet {
            print("🔱 save token: \(token) ")
            UserDefaults.standard.token = token
        }
    }
    
    var userId: Int  = 0 {// – для хранения идентификатора пользователя ВК.
        didSet {
            UserDefaults.standard.userId = userId
        }
    }
    
    private init() {
        
        if let savedToken = UserDefaults.standard.token {
            self.token = savedToken
        }
        
        if UserDefaults.standard.userId > 0 {
            self.userId = UserDefaults.standard.userId
        }
    }
}
