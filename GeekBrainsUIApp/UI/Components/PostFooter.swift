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
    let containerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .orange
        containerStackView.alignment = .center
        containerStackView.axis = .horizontal
        containerStackView.addArrangedSubview(likeView)
        containerStackView.addArrangedSubview(viewsCounter)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerStackView.frame = bounds
    }
}

