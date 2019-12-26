//
//  PhotosViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 12.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosViewController: UICollectionViewController {

    let photoTransitioning = AnimatedPhotoTransitioning()
    
    var photoCollection = Array(1...7)
    var selectedView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        self.collectionView.register(UINib(nibName: PhotoCell.reuseId, bundle: nil), forCellWithReuseIdentifier: PhotoCell.reuseId)
        //Убираем надпись на кнопке возврата
        hideBackButtonTitle()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return photoCollection.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
    
        cell.backgroundColor = .white
        cell.photoView.image = UIImage.getPhoto(by: photoCollection[indexPath.row]) ?? UIImage()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoCell else { return }
        
        selectedView = cell.photoView
        
        let photoDetailViewController = PhotoDetailViewController()
        photoDetailViewController.didChangePhoto = { index in
            let correctedIndex = (index % (self.photoCollection.count - 1)) + 1
            print(correctedIndex)
            photoDetailViewController.nextImageView.image = UIImage.getPhoto(by: correctedIndex) ?? UIImage()
        }
        
    
        photoDetailViewController.index = indexPath.row
        photoDetailViewController.nextImageView.image = UIImage.getPhoto(by: photoCollection[indexPath.row]) ?? UIImage()
        navigationController?.pushViewController(photoDetailViewController, animated: true)
    }
}


extension PhotosViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            return photoTransitioning
        } else {
            return nil
        }
    }
}
