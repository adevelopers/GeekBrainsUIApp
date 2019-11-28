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
        setupActionHideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       NotificationCenter.default.addObserver(self,
                                              selector: #selector(keyboardWasShown),
                                              name: UIResponder.keyboardWillShowNotification,
                                              object: nil)
       
       NotificationCenter.default.addObserver(self,
                                              selector: #selector(keyboardWillBeHidden),
                                              name: UIResponder.keyboardWillHideNotification,
                                              object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func setupPasswordField() {
        let showPasswordButton = UIButton()
        showPasswordButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        showPasswordButton.setImage(.eye, for: .normal)
        showPasswordButton.addTarget(self, action: #selector(didTapShowPassword), for: .touchUpInside)
        passwordField.rightView = showPasswordButton
        passwordField.rightViewMode = .always
    }
    
    private func setupScrollView() {
        scrollView.backgroundColor = .white
    }
    
    private func setupActionHideKeyboard() {
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapOnView)
    }
    
    @objc
    private func didTapShowPassword() {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
    }
}

// MARK: Показ/Скрытие клавиатуры
extension LoginViewController {
    
    @objc
    private func keyboardWasShown(notification: Notification) {
        guard
            let info = notification.userInfo as NSDictionary?,
            let value = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue
        else {
            return
        }
        
        let keyboardSize = value.cgRectValue.size
        scrollView?.setContentOffset(CGPoint(x: 0,
                                             y: keyboardSize.height
                                                - passwordField.frame.height
                                                - passwordLabel.intrinsicContentSize.height),
                                     animated: true)
    }
    
    @objc
    private func keyboardWillBeHidden(notification: Notification) {
        scrollView.setContentOffset(.zero, animated: true)
    }
    
    @objc
    private func hideKeyboard() {
        scrollView?.endEditing(true)
    }

}
