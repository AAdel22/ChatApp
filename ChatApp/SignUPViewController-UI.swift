//
//  SignUPViewController-UI.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/10/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import ProgressHUD

extension SignUpViewController {
    
    func setupTilteLabel() {
        let title = "Sign Up"
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,NSAttributedString.Key.foregroundColor : UIColor.black])
        titleLabel.attributedText = attributedText
    }
    func setupImageView() {
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        imageView.addGestureRecognizer(tabGesture)
    }
    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    func setupNameTextField() {
        containerNameView.layer.borderWidth = 1
        containerNameView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        containerNameView.layer.cornerRadius = 3
        containerNameView.clipsToBounds = true
        nameTextField.borderStyle = .none
        let placeholderAttr = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        nameTextField.attributedPlaceholder = placeholderAttr
        nameTextField.textColor = UIColor(red: 99/225, green: 99/225, blue: 99/255, alpha: 1)
        
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
    func setupSignUpTextField() {
        signUpBTN.setTitle("Sign Up", for: UIControl.State.normal)
        signUpBTN.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signUpBTN.backgroundColor = UIColor.black
        signUpBTN.layer.cornerRadius = 5
        signUpBTN.clipsToBounds = true
        signUpBTN.setTitleColor(.white, for: UIControl.State.normal)
    }
    func setupSignInTextField() {
        let attributedText = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 14)!,NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        let attributedSubText = NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),NSAttributedString.Key.foregroundColor : UIColor.black])
        attributedText.append(attributedSubText)
        signInBTN.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func validateFields() {
        guard let username = self.nameTextField.text, !username.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_USERNAME)
            print("user name is empty")
            return
        }
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL)
            print("user name is email")
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_PASSWORD)
            return
        }
    }
    func signUp(onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void) {
        ProgressHUD.show()
        Api.User.signUp(userName: self.nameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, image: self.image, onSuccess: {
            ProgressHUD.dismiss()
            print("done")
            onSuccess()
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = imageSelected
            imageView.image = imageSelected
        }
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = imageOriginal
            imageView.image = imageOriginal
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
