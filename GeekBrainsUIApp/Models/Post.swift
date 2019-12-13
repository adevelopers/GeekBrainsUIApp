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
                        title: "Заголовок новости \($0)",
                        text: "Текст новости \($0)\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.\n All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                        publishedDate: "\(Int.random(in: 10...23)):\(Int.random(in: 12...49)) ") }
    }
}
