//
//  SearchCell.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 26.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit


final class SeparatorView: UIView {
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .lightyGray
    }
}


final class WhatsNewCell: UITableViewCell {
    
    static let reuseId = "WhatsNewCell"
    
    let separator = SeparatorView()
    let containerView = UIView()
    let avatarView = AvatarView()
    let writeSomethingLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        
        containerView.addSubviews([
            avatarView,
            writeSomethingLabel
        ])
        
        addSubviews([
            separator,
            containerView
        ])
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        avatarView.image = UIImage(imageLiteralResourceName: "lena")
        writeSomethingLabel.text = "Напишите что-нибудь..."
        writeSomethingLabel.textColor = .lightGray
        selectionStyle = .none
    }
    
    private func setupConstraints() {
        
        separator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(15)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        
        avatarView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(19)
            $0.width.height.equalTo(56)
            $0.centerY.equalToSuperview()
        }
        
        writeSomethingLabel.snp.makeConstraints {
            $0.left.equalTo(avatarView.snp.right).offset(12)
            $0.centerY.equalToSuperview()
        }
    }
}
