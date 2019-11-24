//
//  ViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailPhoneLabel: UILabel!
    @IBOutlet weak var emailPhoneField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBAction func didTapSignIn(_ sender: Any) {
        guard
            let emailOrPhone = emailPhoneField.text,
            let password = passwordField.text
        else {
            return
        }
        
        print("введены \(emailOrPhone) и \(password)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupScrollView()
        setupPasswordField()
    }

    private func setupPasswordField() {
        let showPasswordButton = UIButton()
        showPasswordButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        showPasswordButton.setImage(.eye, for: .normal)
        passwordField.rightView = showPasswordButton
        passwordField.rightViewMode = .always
    }
    

    private func setupScrollView() {
        scrollView.backgroundColor = .white
    }
}

