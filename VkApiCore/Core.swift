//
//  Core.swift
//  VkApiCore
//
//  Created by Kirill Khudiakov on 27.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation

public protocol VKApiProtocol {
    func getGroups(_ credential: Credential, completion: @escaping (Result<VKResponse<VKGroup>, Error>) -> Void)
    func getFriends(credential: Credential, completion: @escaping (Result<VKResponse<VKUser>, Error>) -> Void)
}
