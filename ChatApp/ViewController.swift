//
//  ViewController.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/8/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signInWithFaceBookBTN: UIButton!
    @IBOutlet weak var signInWithGoogleBTN: UIButton!
    @IBOutlet weak var createNewAccountBtn: UIButton!
    @IBOutlet weak var termsOfServiceLabel: UILabel!
    @IBOutlet weak var ORLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        setupHeaerTitle()
        setupOrLabel()
        setuptermsOfServiceLabel()
        setupsignWithFaceBookButton()
        setupsignWithGoogleButton()
        setupCreateAccountButton()
    }
}






