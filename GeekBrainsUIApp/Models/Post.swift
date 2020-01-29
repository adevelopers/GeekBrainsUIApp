//
//  Post.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 07.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import Foundation




struct Post {
    let id: String
    let imagePath: String
    let title: String
    let text: String
    let publishedDate: String
}


extension Post {
    static func generateDemoPosts(with limit: Int) -> [Post] {
        return Array(repeating: 1, count: limit + 1)
            .enumerated()
            .filter { $0.offset > 0 }
            .map { $0.offset }
            .map { Post(id: "\($0)",
                        imagePath: "post\($0)",
                        title: "Тина Канделаки",
                        text: "Залог хорошего утра для меня --- это спорт, душ и чашечка чая. Готова покорять мир! Желаю вам продуктивной недели и отличного настроения",
                        publishedDate: "\(Int.random(in: 10...23)):\(Int.random(in: 12...49)) ") }
    }
}
