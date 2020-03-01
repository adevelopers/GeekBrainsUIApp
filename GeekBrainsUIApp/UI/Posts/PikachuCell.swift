//
//  PikachuCell.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.02.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit


final class PikachuCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    private lazy var pikaImageView: UIImageView = {
       let imageView = UIImageView()
        
       return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupUI() {
        addSubview(pikaImageView)
    }
    private func setupConstraints() {
        pikaImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(model: PostModel) {
        switch model {
        case .pika:
            pikaImageView.image = .pikachu
            handle(image: .pikachu) { [weak self] image in
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.5) {
                        self?.pikaImageView.image = image
                    }
                }
            }
        }
    }
    
    func handle(image: UIImage, completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global().async {
            let ciImage = CIImage(image: image)
            let filter = CIFilter(name: "CIGaussianBlur")
            filter?.setValue(ciImage, forKey: "inputImage")
            filter?.setValue(10, forKey: "inputRadius")
            sleep(1)
            if let blurredCIImage = filter?.outputImage {
                completion(UIImage(ciImage: blurredCIImage))
            }
        }
    }
}

