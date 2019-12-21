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
    let nextImageView = UIImageView()
    
    var didChangePhoto: ((Int) -> Void)?
    var index = 0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideBackButtonTitle()

        imageView.contentMode = .scaleAspectFit
        nextImageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        view.addSubview(nextImageView)
        
        imageView.frame = view.frame
        imageView.center = view.center
        imageView.alpha = 0
        
        nextImageView.frame = view.frame
        nextImageView.center = view.center
        
        
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
        print("left")
        print(index)
        
        if let didChangePhoto = didChangePhoto {
            didChangePhoto(index)
        }
        
        animatedShow()
    }
    
    @objc
    private func didRightSwipe() {
        index -= 1
        if index < 1 {
            index = 1
        }
        
        print("right")
        print(index)
        
        if let didChangePhoto = didChangePhoto {
            didChangePhoto(abs(index))
        }
        animatedShow()
    }

    private func animatedShow() {
        nextImageView.alpha = 0
        imageView.alpha = 1
        view.isUserInteractionEnabled = false
        UIView.animate(withDuration: 2, animations: {
            self.imageView.alpha = 0
            self.nextImageView.alpha = 1
        }, completion: { _ in
            self.imageView.image = self.nextImageView.image
            self.imageView.alpha = 1
            self.nextImageView.alpha = 0
            self.view.isUserInteractionEnabled = true
        })
    }
}
