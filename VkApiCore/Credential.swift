//
//  Credential.swift
//  VkApiKit
//
//  Created by Kirill Khudiakov on 27.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation


public struct Credential {
    public let token: String
    public let userId: Int
    
    public init(token: String, userId: Int) {
        self.token = token
        self.userId = userId
    }
}
