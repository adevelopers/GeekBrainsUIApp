//
//  ViewsCounterView.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 14.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class ViewsCounterView: UIView {
    
    let viewsCountLabel = UILabel()
    let viewsIcon = UIImageView(image: .eye)
    
    var count: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .green
        
    }
}
