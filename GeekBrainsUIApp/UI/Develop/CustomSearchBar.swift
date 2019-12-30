//
//  CustomSearchBar.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit


final class KKTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    private func setupUI() {}
    private func setupConstraints() {}
}


final class CustomSearchBar: UIView {
    
    let textField = KKTextField()
    let clearButton = UIImageView(image: .clearButton)
    let searchAnimationLayer = CALayer()
    let placeholderLayer = CATextLayer()
    let searchIconLayer = CAShapeLayer()
    let duration: TimeInterval = 0.3
    
    var textColor: UIColor = .white
    var fontSize: CGFloat = 14
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews([
            textField
        ])
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clearButton.center.x += 30
        searchAnimationLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        searchAnimationLayer.position.y = 3
        searchAnimationLayer.position.x = bounds.width / 2 - placeholderLayer.frame.width / 2
        
    }
    
    private func setupUI() {
        layer.cornerRadius = 12
        clipsToBounds = true
        textField.backgroundColor = .clear
        textField.textColor = textColor
        clearButton.contentMode = .scaleAspectFit
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 14+6, height: 14))
        rightView.addSubview(clearButton)
        clearButton.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(didTapClearButton)))
        textField.rightView = rightView
        textField.rightViewMode = .always
        textField.delegate = self
        
        textField.addTarget(self, action: #selector(textDidChanged(_:)), for: .editingChanged)
        
        setupPlaceholder()
    }
    
    private func setupPlaceholder() {
        let iconLayer = CAShapeLayer()
        iconLayer.contents = UIImage.searchIcon.cgImage
        iconLayer.frame = CGRect(origin: .zero, size: UIImage.searchIcon.size)
        iconLayer.contentsGravity = .resizeAspect
        
        searchIconLayer.path = UIBezierPath(rect: CGRect(origin: .zero, size: UIImage.searchIcon.size)).cgPath
        
        searchIconLayer.fillColor = textColor.cgColor
        searchIconLayer.fillRule = .evenOdd
        searchIconLayer.addSublayer(iconLayer)
        searchIconLayer.mask = iconLayer
        searchIconLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        searchIconLayer.position.y += 1
        searchIconLayer.position.x -= 6
        
        
        textField.font = .systemFont(ofSize: fontSize, weight: .regular)
        placeholderLayer.fontSize = fontSize
        placeholderLayer.string = "Поиск"
        placeholderLayer.alignmentMode = .center
        placeholderLayer.foregroundColor = textColor.cgColor
        placeholderLayer.frame = CGRect(x: 0, y: 0, width: 70, height: 24)
        
        searchAnimationLayer.addSublayer(placeholderLayer)
        searchAnimationLayer.addSublayer(searchIconLayer)
        textField.layer.addSublayer(searchAnimationLayer)
    }
    
    private func setupConstraints() {
        textField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func animatedStartEditing() {
        print(searchAnimationLayer.position.x)
        let step = searchAnimationLayer.position.x - 12
        UIView.animate(withDuration: duration) { [weak self] in
            self?.clearButton.center.x -= 30
            self?.searchAnimationLayer.setAffineTransform(.init(translationX: -step, y: 0))
        }
    }
    
    private func animatedEndEditing() {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.clearButton.center.x += 30
            self?.searchAnimationLayer.setAffineTransform(.identity)
        }
    }
    
    @objc
    private func didTapClearButton() {
        textField.text = ""
        clearButton.isUserInteractionEnabled = false
        textField.endEditing(true)
    }
    
    @objc
    func textDidChanged(_ textField: UITextField) {
        if let text = textField.text, text.count > 0 {
            placeholderLayer.opacity = 0
        } else {
            placeholderLayer.opacity = 1
        }
    }
}

extension CustomSearchBar: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        clearButton.isUserInteractionEnabled = true
        
        animatedStartEditing()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            placeholderLayer.opacity = 1
        }
        
        animatedEndEditing()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

