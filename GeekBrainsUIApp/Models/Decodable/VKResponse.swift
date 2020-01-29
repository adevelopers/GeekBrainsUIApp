//
//  VKResponse.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 29.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation


struct VKResponse<T: Decodable>: Decodable {
    
    let response: Response?
    let error: VKError?
    
    struct Response: Decodable {
        let count: Int?
        let items: [T]
    }
    
    struct VKError: Decodable {
        let error_code: Int?
        let error_msg: String?
    }
}

