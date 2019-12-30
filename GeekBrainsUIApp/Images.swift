//
//  Images.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


extension UIImage {
    static let logo = UIImage(imageLiteralResourceName: "VK-Logo")
    static let logoDarkTheme = UIImage(imageLiteralResourceName: "VK-Logo-inverted")
    static let eye = UIImage(imageLiteralResourceName: "eyeIcon")
    static let noPhoto = UIImage(imageLiteralResourceName: "no-photo")
    
    static let postImage = UIImage(imageLiteralResourceName: "postImage")
    static let postImageList = UIImage(imageLiteralResourceName: "postImageList")
    static let like = UIImage(imageLiteralResourceName: "like")
    static let likeOutline = UIImage(imageLiteralResourceName: "like_outline")
    
    static let comment = UIImage(imageLiteralResourceName: "comment_outline")
    static let share = UIImage(imageLiteralResourceName: "share_outline")
    
    static let verified = UIImage(imageLiteralResourceName: "verified")
    static let more = UIImage(imageLiteralResourceName: "more")
    
    
    static let female = UIImage(imageLiteralResourceName: "lena")
    
    static let clearButton = UIImage(imageLiteralResourceName: "clearButton")
    static let searchIcon = UIImage(imageLiteralResourceName: "searchIcon")
    

    static func getPhoto(by number: Int) -> UIImage? {
        return UIImage(imageLiteralResourceName: "\(number).jpg")
    }
}
