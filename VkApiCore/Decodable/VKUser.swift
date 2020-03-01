//
//  VKUser.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 25.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//


public struct VKUser: Decodable {
    
    public let id: Int
    public var firstName: String
    public var lastName: String?
    public let deactivated: String?
    public let isClosed: Bool?
    public let online: Int
    public let canAccessClosed: Bool?
    
    public let hasPhoto: Int?
    public let photo200orig: String?
    public let sex: Int?
    
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
    
    public init(id: Int, firstName: String, lastName: String?, deactivated: String?, isClosed: Bool?, online: Int, canAccessClosed: Bool?,
                hasPhoto: Int?, photo200orig: String?, sex: Int?) {
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.deactivated = deactivated
        self.isClosed = isClosed
        self.online = online
        self.canAccessClosed = canAccessClosed
        self.hasPhoto = hasPhoto
        self.photo200orig = photo200orig
        self.sex = sex
    }
    
}






