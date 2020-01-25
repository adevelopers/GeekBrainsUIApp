//
//  VKPhoto.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 25.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//


struct VKPhoto {
    let id: Int
    let album_id: Int
    let owner_id: Int
    let user_id: Int
    let text: String
    let date: Int
    let sizes: [Size]
    let width: Int
    let height: Int
}

extension VKPhoto {

    struct Size {
        let type: String
        let url: String
        let width: Int
        let height: Int
    }
}
