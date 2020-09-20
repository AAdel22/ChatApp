//
//  ViewController-UI.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/9/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

extension ViewController {
    func setupHeaerTitle() {
        let title = "Create a new account"
        let subTitle = "\n\nLorem ipsum dolor sit amet conse ctetur adipisicing elit sed do."
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,NSAttributedString.Key.foregroundColor : UIColor.brown])
        
        let attributedSubText = NSMutableAttributedString(string: subTitle, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 15)!,NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.45)])
        attributedText.append(attributedSubText)
        
        let pragraphStyle = NSMutableParagraphStyle()
        pragraphStyle.lineSpacing = 5
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle ,value: pragraphStyle, range: NSMakeRange(0, attributedText.length))
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = attributedText
    }
    func setupOrLabel() {
        ORLabel.text = "Or"
        ORLabel.font = UIFont.boldSystemFont(ofSize: 16)
        ORLabel.textColor = UIColor(white: 0, alpha: 0.45)
        ORLabel.textAlignment = .center
    }
    
    func setuptermsOfServiceLabel() {
        let attributedTermsText = NSMutableAttributedString(string: "By clicking 'Create a new account you' agree to our", attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 14)!,NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        let attributedSubTermsText = NSMutableAttributedString(string: "\nTerms Service", attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 18)!,NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        attributedTermsText.append(attributedSubTermsText)
        termsOfServiceLabel.attributedText = attributedTermsText
        termsOfServiceLabel.numberOfLines = 0
    }
    
    func setupsignWithFaceBookButton() {
        signInWithFaceBookBTN.setTitle("sign in with Facebook", for: UIControl.State.normal)
        signInWithFaceBookBTN.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInWithFaceBookBTN.backgroundColor = UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
        signInWithFaceBookBTN.layer.cornerRadius = 5
        signInWithFaceBookBTN.clipsToBounds = true
        signInWithFaceBookBTN.setImage(UIImage(named: "icon-facebook"), for: UIControl.State.normal)
        signInWithFaceBookBTN.imageView?.contentMode = .scaleAspectFit
        signInWithFaceBookBTN.tintColor = .white
        signInWithFaceBookBTN.imageEdgeInsets = UIEdgeInsets(top: 12, left: 80, bottom: 12, right: 250)
    }
    func setupsignWithGoogleButton() {
        signInWithGoogleBTN.setTitle("sign in with Google", for: UIControl.State.normal)
        signInWithGoogleBTN.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInWithGoogleBTN.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        signInWithGoogleBTN.layer.cornerRadius = 5
        signInWithGoogleBTN.clipsToBounds = true
        signInWithGoogleBTN.setImage(UIImage(named: "icon-google"), for: UIControl.State.normal)
        signInWithGoogleBTN.imageView?.contentMode = .scaleAspectFit
        signInWithGoogleBTN.tintColor = .white
        signInWithGoogleBTN.imageEdgeInsets = UIEdgeInsets(top: 12, left: 80, bottom: 12, right: 250)
    }
    func setupCreateAccountButton() {
        createNewAccountBtn.setTitle("Create a new account", for: UIControl.State.normal)
        createNewAccountBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        createNewAccountBtn.backgroundColor = UIColor.black
        createNewAccountBtn.layer.cornerRadius = 5
        createNewAccountBtn.clipsToBounds = true
    }
}
