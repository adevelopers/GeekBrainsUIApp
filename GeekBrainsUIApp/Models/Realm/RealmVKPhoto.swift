//
//  RealmVKPhoto.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 29.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import RealmSwift


protocol VKPhotoProtocol {
    var id: Int { get }
    var name: String { get }
    var albumId: Int { get }
    var ownerId: Int { get }
    var userId: Int { get }
    var text: String { get }
    var date: Int { get }
    var width: Int { get }
    var height: Int { get }
}

class RealmVKPhoto: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var albumId = 0
    @objc dynamic var ownerId: Int = 0
    @objc dynamic var userId = 0
    @objc dynamic var text = ""
    @objc dynamic var date: Int = 0
    @objc dynamic var width = 0
    @objc dynamic var height = 0
    
    var sizes = List<PhotoSize>()
}

class PhotoSize: Object {
    var type = ""
    var url = ""
    var width = 0
    var height = 0
}
