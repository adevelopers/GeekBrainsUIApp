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
    
    struct Response: Decodable {
        let count: Int?
        let items: [T]
    }
}
