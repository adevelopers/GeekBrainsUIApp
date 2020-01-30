//
//  UserRepository.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import RealmSwift


protocol UserRpositoryProtocol {
    func add(from items: [VKUserProtocol])
    func getAll() throws -> [VKUserProtocol]
}

final class UserRepository: UserRpositoryProtocol {
    
    func add(from items: [VKUserProtocol]) {
        do {
            let realm = try! Realm()
            
            try realm.write {
                items.forEach {
                    let record = RealmVKUser()
                    record.map(from: $0)
                    realm.add(record, update: .modified)
                }
            }
        } catch {
            print("❌ \(error)")
        }
    }
    
    func getAll() throws -> [VKUserProtocol] {
        do {
            let realm = try Realm()
            return realm.objects(RealmVKUser.self)
                .map { $0.model() }
        } catch {
            throw error
        }
    }
    
}
