//
//  GroupRepository.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 29.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import RealmSwift


protocol GroupRpositoryProtocol {
    func add(from items: [VKGroupProtocol])
    func getAll() throws -> [VKGroupProtocol]
    func remove(items: [RealmVKGroup]) 
}

final class GroupRepository: GroupRpositoryProtocol {
    
    
    func add(from items: [VKGroupProtocol]) {
        do {
            let realm = try! Realm()
            
            try realm.write {
                items.forEach {
                    let realmVkGroup = RealmVKGroup()
                    realmVkGroup.map(from: $0)
                    realm.add(realmVkGroup, update: .modified)
                }
            }
        } catch {
            print("❌ \(error)")
        }
    }
    
    func getAll() throws -> [VKGroupProtocol] {
        do {
            let realm = try Realm()
            return realm.objects(RealmVKGroup.self)
                        .map { $0.model() }
        } catch {
            throw error
        }
    }
    
    func getObjects() throws -> Results<RealmVKGroup> {
        do {
            let realm = try Realm()
            return realm.objects(RealmVKGroup.self)
        } catch {
            throw error
        }
    }
    
    
    
    // DELETE
    func remove(items: [RealmVKGroup]) {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.delete(items)
            }
        } catch {
            print("❌ \(error)")
        }
    }
}
