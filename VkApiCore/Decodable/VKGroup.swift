//
//  VKGroup.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 25.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//


public protocol VKGroupProtocol {
    var id: Int { get }
    var name: String { get }
    var text: String? { get }
    var photo200: String { get }
    
    func map(from model: VKGroupProtocol)
    func model() -> VKGroupProtocol
}

public struct VKGroup: Decodable {
    
    public let id: Int
    public let name: String
    public let screenName: String
    public let isClosed: Int
    public let deactivated: String?
    public let isAdmin: Int
    public let adminLevel: Int?
    public let isMember: Int
    public let isAdvertiser: Int
    public let invitedBy: Int?
    public let type: String
    public let photo50: String
    public let photo100: String
    public let photo200: String
    public let description: String?
    public let activity: String?
    public let status: String?
    
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
    
    public init(id: Int, name: String, screenName: String, isClosed: Int, deactivated: String?, isAdmin: Int,
                adminLevel: Int?, isMember: Int, isAdvertiser: Int,
                invitedBy: Int, type: String, photo50: String, photo100: String,
                photo200: String, description: String, activity: String, status: String) {
        self.id = id
        self.name = name
        self.screenName = screenName
        self.isClosed = isClosed
        self.deactivated = deactivated
        self.isAdmin = isAdmin
        self.adminLevel = adminLevel
        self.isMember = isMember
        self.isAdvertiser = isAdvertiser
        self.invitedBy = invitedBy
        self.type = type
        self.photo50 = photo50
        self.photo100 = photo100
        self.photo200 = photo200
        self.description = description
        self.activity = activity
        self.status = status
    }
}

extension VKGroup: VKGroupProtocol {
    public func model() -> VKGroupProtocol {
        return self
    }
    
    
    public func map(from model: VKGroupProtocol) {
        
    }
    
    public var text: String? {
        return description
    }
    
}
