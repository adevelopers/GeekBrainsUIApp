//
//  RealmVKGroup.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 29.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import RealmSwift


protocol GroupProtocol {
    var id: Int { get }
    var name: String { get }
    var text: String? { get }
    var photo200: String { get }
}

class RealmVKGroup: Object, GroupProtocol {
    
    @objc dynamic var id: Int = -1
    @objc dynamic var name = ""
    @objc dynamic var screenName = ""
    @objc dynamic var isClosed: Int = 0
    @objc dynamic var deactivated = ""
    @objc dynamic var isAdmin: Int = 0
    @objc dynamic var adminLevel: Int = 0
    @objc dynamic var isMember: Int = 0
    @objc dynamic var isAdvertiser: Int = 0
    @objc dynamic var invitedBy: Int = 0
    @objc dynamic var type: String = ""
    @objc dynamic var photo50: String = ""
    @objc dynamic var photo100: String = ""
    @objc dynamic var photo200: String = ""
    @objc dynamic var text: String? // Описание группы если есть
}
