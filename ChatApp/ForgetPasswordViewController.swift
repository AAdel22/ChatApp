//
//  ForgetPasswordViewController.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/12/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import ProgressHUD

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var containerEmailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        setupEmailTextField()
        setupResetBTN()
    }
    @IBAction func resetPasswordBtn(_ sender: Any) {
        guard let email = emailTextField.text , email != "" else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL_RESET)
            return
        }
        Api.User.resetPassword(email: email, onSuccess: {
            self.view.endEditing(true)
            ProgressHUD.showSuccess(SUCCESS_EMAIL_RESET)
            self.navigationController?.popViewController(animated: true)
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
    }
    @IBAction func dismissBTN(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
