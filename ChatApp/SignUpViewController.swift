//
//  SignUpViewController.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/10/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import ProgressHUD
class SignUpViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerNameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var containerEmailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var containerPasswordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpBTN: UIButton!
    @IBOutlet weak var signInBTN: UIButton!
    
    var image: UIImage? = nil 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTilteLabel()
        setupImageView()
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpTextField()
        setupSignInTextField()
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        self.view.endEditing(true)
        self.validateFields()
        self.signUp(onSuccess: {
            // swith the view
        }) { (errorMessage) in
            ProgressHUD.show(errorMessage)
        }
        
    }
    
    @IBAction func dismissBTN(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
