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
    case users = "uesers.get"
    case groups = "groups.get"
    case groupsSearch = "groups.search"
    case photos = "photos.get"
    case allPohots = "photos.getAll"
    case wallPosts = "wall.get"
}

struct Credential {
    let token: String
    let userId: Int
}


protocol VKApiProtocol {
    func getGroups(_ credential: Credential, completion: @escaping (Result<VKResponse<VKGroup>>) -> Void)
    func getFriends(credential: Credential, completion: @escaping (Result<VKResponse<VKUser>>) -> Void) 
}

class VKApi: VKApiProtocol {
    private let vkURL = "https://api.vk.com/method/"
    
    func testRequest() {
        let urlConvertable = vkURL + ""
        Alamofire.request(urlConvertable, method: .get).responseData { response in
            if
                let responseValue = response.value,
                let jsonObject = try? JSONSerialization.jsonObject(with: responseValue, options: .mutableContainers)
            {
                
                print(" ", jsonObject)
            }
        }
    }
    
    func getWall(_ credential: Credential, wallOwnerId: Int, completion: @escaping (Result<VKResponse<VKPost>>) -> Void) {
        
        let params = [
            "ownerId": credential.userId
        ]
        
        request(credential: credential,
                  request: .wallPosts,
                  params: params,
                  completion: completion)
    }
    
    func getGroups(_ credential: Credential, completion: @escaping (Result<VKResponse<VKGroup>>) -> Void) {
        let params = [
            "owner_id" : "\(credential.userId)",
            "extended" : "1",
            "order": "name",
            "fields": "activity, description"
        ]
        
        
        request(credential: credential, request: .groups,
                  params: params,
                  method: .get,
                  completion: completion)
    }
    
    func searchGroups(with searchString: String, and credential: Credential, completion: @escaping (Result<VKResponse<VKGroup>>) -> Void) {
        let params = ["order": "name",
                      "q": searchString,
                      "type": "group",
                      "fields": "city, domain"
                ]
        
        request(credential: credential,
                  request: .groupsSearch,
                  params: params,
                  method: .get, completion: completion)
    }
    
    func getAllPhotos(_ credential: Credential, completion: @escaping (Result<VKResponse<VKPhoto>>) -> Void) {
        request(credential: credential, request: .allPohots, params: [:], completion: completion)
    }
    
    
    func getFriends(credential: Credential, completion: @escaping (Result<VKResponse<VKUser>>) -> Void) {
        let params = ["order": "name",
                      "fields": "city, domain"
        ]
        
        request(credential: credential,
                  request: .friends,
                  params: params,
                  completion: completion)
    }
    
    
    func getUsers(_ credential: Credential, completion: @escaping (Result<VKResponse<VKUser>>) -> Void) {
        
        let params = [ "order": "name",
                       "fields": "city, domain"
        ]
        
        request(credential: credential, request: .users, params: params, completion: completion)
    }
    
    private func request<ResponseType: Decodable>(credential: Credential,
                           request: ApiRequest,
                           params input: [String: Any],
                           method: HTTPMethod = .get,
                           completion: @escaping (Result<ResponseType>) -> Void) {
        let requestURL = vkURL + request.rawValue
        let defaultParams = ["v": "5.103",
                      "access_token": credential.token,
                      "user_id": credential.userId
            ] as [String: Any]
        
        let params = defaultParams.merging(input, uniquingKeysWith: { currentKey, _ in currentKey })
                
        Alamofire.request(requestURL,
                          method: method,
                          parameters: params)
                .responseString(completionHandler: { result in
                    guard let resultData = result.data else {
                        return
                    }
                    self.printData(resultData)
                    
                    do {
                        let decodedModel = try JSONDecoder().decode(ResponseType.self, from: resultData)
                        completion(.success(decodedModel))
                    } catch {
                        print("❌ \(error)")
                    }
                })
    }
    
    private func printData(_ data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) {
            print("\n🗑: ", json)
        }
    }
    
}
