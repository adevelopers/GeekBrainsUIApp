//
//  VKGroup.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 25.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//


struct VKGroup: Decodable {
    
    let id: Int
    let name: String
    let screenName: String
    let isClosed: Int
    let deactivated: String?
    let isAdmin: Int
    let adminLevel: Int?
    let isMember: Int
    let isAdvertiser: Int
    let invitedBy: Int?
    let type: String
    let photo50: String
    let photo100: String
    let photo200: String
    let description: String?
    let activity: String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case deactivated
        case isAdmin = "is_admin"
        case adminLevel = "admin_level"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case invitedBy = "invited_by"
        case type
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
        case description
        case activity
        case status
    }
}

extension VKGroup: VKGroupProtocol {
    func model() -> VKGroupProtocol {
        return self
    }
    
    
    func map(from model: VKGroupProtocol) {
        
    }
    
    var text: String? {
        return description
    }
    
}
