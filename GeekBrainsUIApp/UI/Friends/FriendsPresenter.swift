//
//  FriendsPresenter.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 06.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import UIKit
import RealmSwift


protocol FriendsPresenter {
    func viewDidLoad()
    
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func getSectionIndexTitles() -> [String]?
    func getTitleForSection(section: Int) -> String?
    func getModelAtIndex(indexPath: IndexPath) -> RealmVKUser?
}

class FriendsPresenterImpl: FriendsPresenter {
    
    private let vkAPI = VKApi()
    private var repository: UserRpositoryProtocol
    
    private var sortedFriendsResults = [Section<RealmVKUser>]()
    private var friendsResult: Results<RealmVKUser>!
    
    private weak var view: FriendsListView?
    
    init(repository: UserRpositoryProtocol, view: FriendsListView) {
        self.repository = repository
        self.view = view
    }
    
    func viewDidLoad() {
        loadRealm()
        loadFromApi()
    }
    
    private func loadRealm() {
        do {
            friendsResult = try repository.getAll()
            makeSortedSections()
            view?.update()
        } catch { print(error) }
    }
    
    private func loadFromApi() {
        vkAPI.getFriends(credential: Session.shared.getCredential()) { [weak self] result in
            switch result {
            case let .success(response):
                if let objects = response.response?.items {
                    self?.repository.add(from: objects)
                }
            case let .failure(error):
                print("\(error)")
            }
            
        }
    }
    
    private func makeSortedSections() {
        let groupedFriends = Dictionary(grouping: friendsResult) { $0.lastName.prefix(1) }
        sortedFriendsResults = groupedFriends.map { Section<RealmVKUser>(title: "\($0.key)", items: $0.value) }
        sortedFriendsResults.sort { $0.title < $1.title }
    }
}



extension FriendsPresenterImpl {
    
    func numberOfSections() -> Int {
        return sortedFriendsResults.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return sortedFriendsResults[section].items.count
    }
    
    func getModelAtIndex(indexPath: IndexPath) -> RealmVKUser? {
        return sortedFriendsResults[indexPath.section].items[indexPath.row]
    }
    
    func getSectionIndexTitles() -> [String]? {
        return sortedFriendsResults.map { $0.title }
    }
    
    func getTitleForSection(section: Int) -> String? {
        return sortedFriendsResults[section].title
    }
}
