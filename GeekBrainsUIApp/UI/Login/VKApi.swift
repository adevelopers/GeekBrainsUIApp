//
//  VKApi.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 20.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Alamofire


enum ApiRequest: String {
    case friends = "friends.get"
    case user = "uesers.get"
    case groups = "groups.get"
    case groupsSearch = "groups.search"
    case photos = "photos.get"
    case allPohots = "photos.getAll"
    case wall = "wall.get"
}

class VKApi {
    let vkURL = "https://api.vk.com/method/"
    
    var token: String
    var userId: String
    
    init(token: String, userId: String) {
        self.token = token
        self.userId = userId
    }
    
    func getGroups(completion: @escaping (Result<String>) -> Void) {
        doRequest(token: token, userId: userId, request: .groups, completion: completion)
    }
    
    func searchGroups(with searchString: String, completion: @escaping (Result<String>) -> Void) {
        let requestURL = vkURL + ApiRequest.groupsSearch.rawValue
                let params = ["v": "5.103",
                              "access_token": token,
                              "user_id": userId,
                              "order": "name",
                              "q": searchString,
                              "type": "group",
                              "fields": "city, fomain"
                ]
                
                
                Alamofire.request(requestURL,
                                  method: .get,
                                  parameters: params)
                        .responseString(completionHandler: { result in
                            completion(.success("Получен список групп по запросу `\(searchString)`"))
                            print(result)
                        })
    }
    
    func getAllPhotos(completion: @escaping (Result<String>) -> Void) {
        doRequest(token: token, userId: userId, request: .allPohots) { _ in
            
        }
    }
    
    
    func getFriends(completion: @escaping (Result<String>) -> Void) {
        let requestURL = vkURL + ApiRequest.friends.rawValue
        let params = ["v": "5.103",
                      "access_token": token,
                      "user_id": userId,
                      "order": "name",
                      "fields": "city, fomain"
        ]
        
        Alamofire.request(requestURL,
                          method: .get,
                          parameters: params)
                .responseString(completionHandler: { result in
                    completion(.success("Получен список друзей"))
                    print(result)
                })
    }
    
    
    func getUsers(token: String, userId: String, completion: @escaping (Result<String>) -> Void) {
        let requestURL = vkURL + "users.get"
        let params = ["v": "5.103",
                      "access_token": token,
                      "user_id": userId,
                      "order": "name",
                      "fields": "city, fomain"
        ]
        
        
        Alamofire.request(requestURL,
                          method: .get,
                          parameters: params)
                .responseString(completionHandler: { result in
                    completion(.success("Получен список пользователей"))
                    print(result)
                })
    }
    
    private func doRequest(token: String, userId: String, request: ApiRequest, completion: @escaping (Result<String>) -> Void) {
        let requestURL = vkURL + request.rawValue
                let params = ["v": "5.103",
                              "access_token": token,
                              "user_id": userId,
                              "order": "name",
                              "fields": "city, fomain"
                ]
                
                
                Alamofire.request(requestURL,
                                  method: .get,
                                  parameters: params)
                        .responseString(completionHandler: { result in
                            completion(.success("Получен список групп"))
                            print(result)
                        })
    }
    
}
