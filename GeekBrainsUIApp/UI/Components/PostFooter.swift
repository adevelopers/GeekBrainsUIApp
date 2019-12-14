//
//  PostFooter.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 13.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


final class PostFooter: UIView {
    
    let likeView = LikeView()
    let viewsCounter = ViewsCounterView()
}


final class ViewsCounterView: UIView {
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
