//
//  VKPhoto.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 25.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//


public struct VKPhoto: Decodable {
    let id: Int
    let albumId: Int?
    let ownerId: Int?
    let userId: Int?
    let text: String?
    let date: Int
    public let sizes: [Size]
    let width: Int?
    let height: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case albumId = "album_id"
        case ownerId = "owner_id"
        case userId = "user_id"
        case text
        case date
        case sizes
        case width
        case height
    }
}

extension VKPhoto {

    public struct Size: Decodable {
        public let type: String
        public let url: String
        let width: Int
        let height: Int
    }
}
