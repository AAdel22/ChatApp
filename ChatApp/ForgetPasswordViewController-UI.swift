//
//  ForgetPasswordViewController-UI.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/12/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

extension ForgetPasswordViewController {
    
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
    func setupResetBTN() {
        resetBTN.setTitle("RESER MY PASSWORD", for: UIControl.State.normal)
        resetBTN.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        resetBTN.backgroundColor = UIColor.black
        resetBTN.layer.cornerRadius = 5
        resetBTN.clipsToBounds = true
        resetBTN.setTitleColor(.white, for: UIControl.State.normal)
    }
}
