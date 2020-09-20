//
//  SignInViewController.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/12/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import ProgressHUD
class SignInViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerEmailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var containerPasswordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInBTN: UIButton!
    @IBOutlet weak var signUpBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTilteLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpTextField()
        setupSignInTextField()
    }
    
    @IBAction func signInBTN(_ sender: Any) {
        self.view.endEditing(true)
        self.validateFields()
        self.signIn(onSuccess: {
            // swith the view
        }) { (errorMessage) in
            ProgressHUD.show(errorMessage)
        }
        
    }
    
    
    @IBAction func dismissBTn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
