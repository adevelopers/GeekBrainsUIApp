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
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        viewsCountLabel.textColor = .lightGray
        viewsCountLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        viewsCountLabel.text = String(132)
        
        addSubviews([
            viewsCountLabel,
            viewsIcon
        ])
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .green
    }
    
    private func setupConstraints() {
        viewsIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewsIcon.leftAnchor.constraint(equalTo: leftAnchor),
            viewsIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        viewsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewsCountLabel.leftAnchor.constraint(equalTo: viewsIcon.rightAnchor, constant: 8),
            viewsCountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            viewsCountLabel.widthAnchor.constraint(equalToConstant: 30),
            viewsCountLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
