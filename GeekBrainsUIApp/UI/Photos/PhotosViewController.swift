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

    var photoCollection = Array(1...32)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.register(UINib(nibName: PhotoCell.reuseId, bundle: nil), forCellWithReuseIdentifier: PhotoCell.reuseId)

        // Do any additional setup after loading the view.
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
        let photoDetailViewController = PhotoDetailViewController()
        photoDetailViewController.didChangePhoto = { index in
            let correctedIndex = index % self.photoCollection.count
            photoDetailViewController.imageView.image = UIImage.getPhoto(by: correctedIndex) ?? UIImage()
        }
//        if let cell = collectionView.cellForItem(at: indexPath) as? PhotoCell {
        photoDetailViewController.index = indexPath.row
        photoDetailViewController.imageView.image = UIImage.getPhoto(by: photoCollection[indexPath.row]) ?? UIImage()
//        }
        
        navigationController?.pushViewController(photoDetailViewController, animated: true)
    }
}
