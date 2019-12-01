//
//  FriendViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


class FriendViewController: UICollectionViewController {

    var model: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitle()
    }

    private func setupTitle() {
        title = model?.name
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendDetailCell.reuseId, for: indexPath) as? FriendDetailCell,
            let friend = model
        else {
            return UICollectionViewCell()
        }
        
        cell.nameLabel.text = friend.name
        cell.avaterImageView.image = friend.avatar.isEmpty
            ? .noPhoto
            : UIImage(imageLiteralResourceName: friend.avatar)
        cell.lastVisitLabel.text = (friend.sex == .male ? "Заходил" : "Заходила") + " час назад"
        
        return cell
    }

}
