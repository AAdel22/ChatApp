//
//  SignInViewController-UI.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/12/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import ProgressHUD
extension SignInViewController {
    
    func setupTilteLabel() {
        let title = "Sign In"
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,NSAttributedString.Key.foregroundColor : UIColor.black])
        titleLabel.attributedText = attributedText
    }
    func setupEmailTextField() {
        containerEmailView.layer.borderWidth = 1
        containerEmailView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        containerEmailView.layer.cornerRadius = 3
        containerEmailView.clipsToBounds = true
        emailTextField.borderStyle = .none
        let placeholderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.textColor = UIColor(red: 99/225, green: 99/225, blue: 99/255, alpha: 1)
    }
    func setupPasswordTextField() {
        containerPasswordView.layer.borderWidth = 1
        containerPasswordView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        containerPasswordView.layer.cornerRadius = 3
        containerPasswordView.clipsToBounds = true
        passwordTextField.borderStyle = .none
        let placeholderAttr = NSAttributedString(string: "Password (8+ Characters)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = UIColor(red: 99/225, green: 99/225, blue: 99/255, alpha: 1)
    }
    func setupSignInTextField() {
        signInBTN.setTitle("Sign In", for: UIControl.State.normal)
        signInBTN.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInBTN.backgroundColor = UIColor.black
        signInBTN.layer.cornerRadius = 5
        signInBTN.clipsToBounds = true
        signInBTN.setTitleColor(.white, for: UIControl.State.normal)
    }
    func setupSignUpTextField() {
        let attributedText = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 14)!,NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        let attributedSubText = NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),NSAttributedString.Key.foregroundColor : UIColor.black])
        attributedText.append(attributedSubText)
        signUpBTN.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
    func validateFields() {
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL)
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_PASSWORD)
            return
        }
    }
    
    func signIn(onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void) {
        
        ProgressHUD.show()
        Api.User.signIn(email: self.emailTextField.text!, password: self.passwordTextField.text!, onSuccess: {
            ProgressHUD.dismiss()
            onSuccess()
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
}
