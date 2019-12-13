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
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = ""
        backButtonItem.tintColor = .white
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonItem
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
         return photoCollection.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
    
        // Configure the cell
        cell.backgroundColor = .white
        cell.photoView.image = UIImage.getPhoto(by: Int.random(in: 1...11)) ?? UIImage()
        return cell
    }
}
