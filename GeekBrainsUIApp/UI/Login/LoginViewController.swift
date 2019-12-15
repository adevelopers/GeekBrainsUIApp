//
//  ViewController.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 23.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import UIKit

enum Segues: String {
    case tabbar
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailPhoneLabel: UILabel!
    @IBOutlet weak var emailPhoneField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupPasswordField()
        setupActionHideKeyboard()
        setDemoCredentials()
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateLogo()
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard
            let login = emailPhoneField.text,
            let passord = passwordField.text
        else {
            return false
        }
        
        switch Segues(rawValue: identifier) {
        case .tabbar:
            if isValid(credentials: (login, passord)) {
                return true
            } else {
                showError(message: "Введены неверные данные пользователя")
            }
            return false
        default:
            return false
        }
    }
    
}

extension LoginViewController {
    
    private func isValid(credentials: (login: String, password: String)) -> Bool {
        if
            credentials.login == "client",
            credentials.password == "12345"
        {
            print("✅")
            return true
        } else {
            print("❌")
            return false
        }
    }
    
    private func showError(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func setDemoCredentials() {
        emailPhoneField.text = "client"
        passwordField.text = "12345"
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


// MARK: Анимации
extension LoginViewController {
    private func animateLogo() {
        logoView.alpha = 0
        view.layoutIfNeeded()
        UIView.animate(withDuration: 1) { [weak self] in
            self?.logoView.alpha = 1
            self?.view.layoutIfNeeded()
        }
    }
}
