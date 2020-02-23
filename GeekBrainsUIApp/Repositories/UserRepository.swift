//
//  UserRepository.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import RealmSwift


protocol UserRpositoryProtocol {
    func add(from items: [VKUser])
    func getAll() throws -> Results<RealmVKUser>
}

final class UserRepository: UserRpositoryProtocol {
    
    func add(from items: [VKUser]) {
        do {
            let realm = try! Realm()
            
            try realm.write {
                items.forEach {
                    let record = RealmVKUser(from: $0)
                    realm.add(record, update: .modified)
                }
            }
        } catch {
            print("❌ \(error)")
        }
    }
    
    func getAll() throws -> Results<RealmVKUser> {
        do {
            let realm = try Realm()
            return realm.objects(RealmVKUser.self)
        } catch {
            throw error
        }
    }
    
}
