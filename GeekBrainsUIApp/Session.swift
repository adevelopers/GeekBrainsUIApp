//
//  Session.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 13.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//


final class Session {
    static let shared = Session()
    
    var token: String = "" // – для хранения токена в VK,
    var userId: String  = "" // – для хранения идентификатора пользователя ВК.
    
    private init() {}
}
