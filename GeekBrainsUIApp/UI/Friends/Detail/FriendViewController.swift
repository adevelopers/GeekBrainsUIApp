//
//  FriendViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 01.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


class FriendViewController: UICollectionViewController {

    var model: VKUserProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitle()
        hideBackButtonTitle()
    }

    private func setupTitle() {
        title = model?.firstName
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
        
        cell.nameLabel.text = friend.firstName
        if
            let photoLink = friend.photo200orig,
            let photoUrl = URL(string: photoLink) {
            cell.avaterImageView.kf.setImage(with: photoUrl)
        }
        cell.avaterImageView.backgroundColor = .gray
        cell.lastVisitLabel.text = (friend.sex == 1  ? "Заходила" : "Заходил") + " час назад"
        
        return cell
    }

}
