//
//  CustomCollectionViewLayout.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 10.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


enum CollectionCellSize {
    case small
    case wide
}

class CustomCollectionViewLayout: UICollectionViewLayout {
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    var columns = 2
    var cellHeight = 150
    var containterHeight: CGFloat = 0
    
    override func prepare() {
        guard let collectionView = collectionView else {
            return
        }
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        let commonWidth = collectionView.frame.width
        let smallWidth = collectionView.frame.width / CGFloat(columns)
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for element in 0..<itemsCount {
            let indexPath = IndexPath(item: element, section: 0)
            let attributeForIndex = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            let typeCell : CollectionCellSize = (element + 1) % (columns + 1) == 0 ? .wide : .small
            switch typeCell {
            case .wide:
                attributeForIndex.frame = CGRect(x: 0,
                                                 y: y,
                                                 width: commonWidth,
                                                 height: CGFloat(cellHeight))
                y += CGFloat(cellHeight)
            case .small:
                attributeForIndex.frame = CGRect(x: x,
                                                y: y,
                                                width: smallWidth,
                                                height: CGFloat(cellHeight))
                
                if (element + 2) % (columns + 1) == 0 || element == itemsCount - 1 {
                    y += CGFloat(cellHeight)
                    x = 0
                } else {
                    x += smallWidth
                }
            }
            cacheAttributes[indexPath] = attributeForIndex
        }
        containterHeight = y
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter {
            rect.intersects($0.frame)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else {
            return CGSize.zero
        }
        
        return CGSize(width: collectionView.frame.width,
                      height: CGFloat(containterHeight))
    }
    
    
}
