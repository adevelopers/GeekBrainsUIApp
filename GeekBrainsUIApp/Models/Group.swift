//
//  Group.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import Foundation


struct Group {
    let id: String
    let name: String
    let description: String
    let avatar: String
    let isInGroup: Bool
}


extension Group {
    static let items = [
        Group(id: "1", name: "Интернет вещей", description: "IoT, Smart devices", avatar: "iot", isInGroup: true),
        Group(id: "2", name: "Соус", description: "Рецепты", avatar: "sous", isInGroup: true),
        Group(id: "3", name: "Идеи для дома", description: "другие хобби", avatar: "idea", isInGroup: true),
        Group(id: "4", name: "Фитнесс", description: "", avatar: "fitness", isInGroup: true),
        Group(id: "5", name: "Мобильная разработка", description: "", avatar: "ios2", isInGroup: false),
        Group(id: "6", name: "PeerLab", description: "", avatar: "ios", isInGroup: false),
        Group(id: "7", name: "Еда", description: "Стейки", avatar: "meat" , isInGroup: false),
    ]
}
