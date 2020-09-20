//
//  Ref.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/19/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import Foundation
import Firebase
 
let REF_USER = "users"
let URL_STORAGE_ROORT = "gs://chatapp-96175.appspot.com"
let STORAGE_PROFILE = "profile"
let PROFILE_IMAGE_URL = "profileImageUrl"
let UID = "uid"
let EMAIL = "email"
let USERNAME = "username"
let STATUS = "status"
let ERROR_EMPTY_PHOTO = "please choose your profile image"
let ERROR_EMPTY_EMAIL = "please enter an email Address"
let ERROR_EMPTY_USERNAME = "please enter an userName"
let ERROR_EMPTY_PASSWORD = "plese enter a password"
let ERROR_EMPTY_EMAIL_RESET = "plese Enter an email address for password reset"
let SUCCESS_EMAIL_RESET = "we have just sent you a password reset email. please cheak your inbox and follow the instructions to reset your password "
class Ref {
    
    let databaseRoot: DatabaseReference = Database.database().reference()
    
    var databaseUser: DatabaseReference {
        return databaseRoot.child(REF_USER)
    }
    func databaseSpecificUser(uid: String) -> DatabaseReference{
        return databaseUser.child(uid)
    }
    
    // Storage Ref
    
    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROORT)
    
    var storageProfile: StorageReference {
        return storageRoot.child(STORAGE_PROFILE)
    }
    
    func storageSpecificProfile(uid: String) -> StorageReference {
        return storageProfile.child(uid)
    }
}
