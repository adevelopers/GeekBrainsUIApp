//
//  PostsPresenter.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import UIKit
import VkApiKit

enum PostModel {
    case pika
}

protocol PostsPresenter {
    func numberOfRows(in section: Int) -> Int
    func modelForRowAt(_ indexPath: IndexPath) -> PostModel
}


final class PostsPresenterImp: PostsPresenter {
    private let api = VKApi()
    
    var posts: [PostModel] = [.pika, .pika, .pika, .pika, .pika, .pika, .pika, .pika, .pika, .pika, .pika, .pika, .pika, .pika]
    
    init() {
        print("🐼 Запрашиваем посты новостной ленты/Стены")
        let credential = Session.shared.getCredential()
        print("token: ", credential.token)
        print("userId: ", credential.userId)
        
        api.getWall(credential, wallOwnerId: Session.shared.userId) { result in
            print(result)
            switch result {
            case let .success(serverResponse):
                if let error = serverResponse.error {
                    print("❌ ")
                    return
                }
                print(serverResponse.response)
                break
            case let .failure(error):
                break
            }
        }
    }
    
    func numberOfRows(in section: Int) -> Int {
        return posts.count
    }
    
    func modelForRowAt(_ indexPath: IndexPath) -> PostModel {
        return posts[indexPath.row]
    }
    
}
