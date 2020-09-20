//
//  UserApi.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/19/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import Firebase
import ProgressHUD
import FirebaseStorage
class UserApi {
    
    func resetPassword(email: String,onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                onSuccess()
            } else {
                onError(error!.localizedDescription)
            }
        }
        
    }
    func signIn(email: String, password: String,onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            print(authData?.user.uid)
            onSuccess()
        }
        
    }
    func signUp(userName: String, email: String, password: String,image: UIImage?, onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                let dict: Dictionary <String,Any> = [
                    UID: authData.user.uid,
                    EMAIL: authData.user.email,
                    USERNAME: userName,
                    PROFILE_IMAGE_URL: "",
                    STATUS: "Welcome to Chat"
                ]
                guard let imageSelected = image else {
                    ProgressHUD.showError(ERROR_EMPTY_PHOTO)
                    return
                }
                guard let imageData = imageSelected .jpegData(compressionQuality: 0.4) else {
                    return
                }
                
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid)
                
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpg"
                
                StorageService.savePhoto(username: userName, uid: authData.user.uid, data: imageData, metaData: metaData, storageProfileRef: storageProfile, dict: dict, onSuccess: {
                    onSuccess()
                }, onError: {(errorMessage) in
                    onError(errorMessage)
                })
                
            }
        }
    }
}
