//
//  VKUser.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 25.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//


struct VKUser: Decodable {
    
    let id: Int
    var firstName: String
    var lastName: String?
    let deactivated: String?
    let isClosed: Bool
    let online: Int
    let canAccessClosed: Bool
    
    let hasPhoto: Int?
    let photo200orig: String?
    let sex: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case deactivated
        case isClosed = "is_closed"
        case online
        case canAccessClosed = "can_access_closed"
        case hasPhoto = "has_photo"
        case photo200orig = "photo_200_orig"
        case sex
    }
}

extension VKUser: VKUserProtocol {}
