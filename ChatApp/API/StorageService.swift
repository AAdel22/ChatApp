//
//  StorageService.swift
//  ChatApp
//
//  Created by Alaa Adel on 9/19/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import ProgressHUD
class StorageService {
    static func savePhoto(username: String, uid: String, data: Data, metaData: StorageMetadata, storageProfileRef: StorageReference, dict: Dictionary<String, Any>,onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void ) {
        storageProfileRef.putData(data, metadata: metaData) { (storageMetaData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            storageProfileRef.downloadURL { (url, error) in
                if let metaImageUrl = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges { (error) in
                            if let error = error {
                                ProgressHUD.showError(error.localizedDescription)
                            }
                        }
                    }
                    var dictTemp = dict
                    dictTemp[PROFILE_IMAGE_URL] = metaImageUrl
                    Ref().databaseSpecificUser(uid: uid).updateChildValues(dictTemp) { (error, ref) in
                            if error == nil {
                                onSuccess()
                                
                            }else {
                                onError(error!.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}
