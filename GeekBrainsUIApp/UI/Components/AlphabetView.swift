//
//  AlphabetView.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 08.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


struct AlphabetLetter {
    let letter: String
}



final class AlphabetControl: UIControl {
    
    typealias LetterType = String
    typealias Subscription = (LetterType) -> Void
    let stackView = UIStackView(frame: .zero)
    var subscriptions: [Subscription] = []
    
    var list: [LetterType] = [] {
        didSet {
            list.forEach {
                let letterButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 16));
                letterButton.setTitle("\($0.uppercased())", for: .normal)
                letterButton.setTitleColor(tintColor, for: .normal)
                letterButton.addTarget(self, action: #selector(didTapLetter), for: .touchDown)
                stackView.addArrangedSubview(letterButton)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    func rx_subscribe(onNext: @escaping Subscription) {
        subscriptions.append(onNext)
    }
    
    @objc
    private func didTapLetter(sender: UIButton) {
        guard let letter = sender.title(for: .normal) else { return }
        subscriptions.forEach {
            $0(letter)
        }
    }
    
}
