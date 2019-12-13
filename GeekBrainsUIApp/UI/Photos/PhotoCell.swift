//
//  PhotoCell.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 13.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoView: UIImageView!
    
    static let reuseId = "PhotoCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoView.contentMode = .scaleAspectFill
    }
    
    

}
