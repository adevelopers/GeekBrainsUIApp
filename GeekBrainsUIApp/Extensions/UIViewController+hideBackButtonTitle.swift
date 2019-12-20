//
//  UIViewController+hideBackButtonTitle.swift
//  GeekBrainsUIApp
//
//  Created by Кирилл Худяков on 14.12.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit


extension UIViewController {
    func hideBackButtonTitle() {
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = ""
        backButtonItem.tintColor = .black
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonItem
    }
}


