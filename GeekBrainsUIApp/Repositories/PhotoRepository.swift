//
//  PhotoRepository.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import RealmSwift


protocol PhotoRpositoryProtocol {
    func add(from items: [VKPhotoProtocol])
    func getAll() throws -> [VKPhotoProtocol]
}

final class PhotoRepository: PhotoRpositoryProtocol {
    
    func add(from items: [VKPhotoProtocol]) {
        
    }
    
    func getAll() throws -> [VKPhotoProtocol] {
        return []
    }
    
}
