//
//  VKResponse.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 29.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation


public struct VKResponse<T: Decodable>: Decodable {
    
    public let response: Response?
    public let error: VKError?
    
    enum CodingKeys: String, CodingKey {
        case response
        case error
    }
    
    
    
    public struct Response: Decodable {
        public let count: Int?
        public let items: [T]
        
        enum CodingKeys: String, CodingKey {
            case count
            case items
        }

    }
    
    public struct VKError: Decodable {
        public let error_code: Int?
        public let error_msg: String?
    }
}

