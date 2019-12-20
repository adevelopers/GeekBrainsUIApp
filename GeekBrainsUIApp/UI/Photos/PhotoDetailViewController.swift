//
//  PhotoDetailViewController.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 20.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit



class PhotoDetailViewController: UIViewController {

    let imageView = UIImageView()
    
    var didChangePhoto: ((Int) -> Void)?
    var index = 0
//    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideBackButtonTitle()

        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.bounds = view.bounds
        imageView.center = view.center
        
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didLeftSwipe))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didRightSwipe))
        rightSwipe.direction = .right
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc
    private func didLeftSwipe() {
        index += 1
        
        if let didChangePhoto = didChangePhoto {
            didChangePhoto(index)
        }
    }
    
    @objc
    private func didRightSwipe() {
        index -= 1
        if let didChangePhoto = didChangePhoto {
            didChangePhoto(index)
        }
    }

}
