//
//  RealmVKUser.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 29.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import RealmSwift


protocol  VKUserProtocol {
    var id: Int { get }
    var firstName: String { get }
    var lastName: String { get }
    var photo200orig: String? { get }
    var sex: Int? { get }
}

class RealmVKUser: Object, VKUserProtocol {
    @objc dynamic var id = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var deactivated: String?
    @objc dynamic var isClosed: Bool = false
    @objc dynamic var online: Int = 0
    @objc dynamic var canAccessClosed: Bool = false
    
    // Опциональная поля
    var hasPhoto: Int?
    var sex: Int?
    @objc dynamic var photo200orig: String?
    
    
    // По `id`  при совпадении: перезаписывает, а не дублирует
    override class func primaryKey() -> String? {
        return "id"
    }
    
    override class func indexedProperties() -> [String] {
        return ["firstName", "deactivated"]
    }
}

extension RealmVKUser {
    
    convenience init(from model: VKUser) {
        self.init()
        id = model.id
        firstName = model.firstName
        lastName = model.lastName ?? ""
        photo200orig = model.photo200orig
        sex = model.sex
    }
    
    
    func model() -> VKUser {
        return VKUser(id: id,
                      firstName: firstName,
                      lastName: lastName,
                      deactivated: deactivated,
                      isClosed: isClosed,
                      online: online,
                      canAccessClosed: canAccessClosed,
                      hasPhoto: hasPhoto,
                      photo200orig: photo200orig,
                      sex: sex
        )
    }
}
