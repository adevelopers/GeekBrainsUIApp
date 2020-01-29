//
//  RealmVKUser.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 29.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import RealmSwift


class RealmVKUser: Object {
    @objc dynamic var id = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String?
    @objc dynamic var deactivated: String?
    @objc dynamic var isClosed: Bool = false
    @objc dynamic var online: Int = 0
    @objc dynamic var canAccessClosed: Bool = false
    
    // По `id`  при совпадении: перезаписывает, а не дублирует
    override class func primaryKey() -> String? {
        return "id"
    }
    
    override class func indexedProperties() -> [String] {
        return ["firstName", "deactivated"]
    }
}

extension RealmVKUser {
    
    func mapTo() -> VKUser {
        return VKUser(id: id,
                      first_name: firstName,
                      last_name: lastName,
                      deactivated: deactivated,
                      is_closed: isClosed,
                      online: online,
                      can_access_closed: canAccessClosed)
    }
}
