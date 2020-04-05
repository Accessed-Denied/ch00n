//
//  UserModel.swift
//  ch00n
//
//  Created by MACBOOK on 02/04/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class User: NSObject {
    
    //MARK: Properties
    let name: String
    let email: String
    let id: String
    var profilePic: UIImage
    var latitude: Any
    var longitude: Any
    
    //MARK: Inits
    init(name: String, email: String, id: String, profilePic: UIImage,latitude: Any,longitude: Any) {
        self.name = name
        self.email = email
        self.id = id
        self.profilePic = profilePic
        self.longitude = longitude
        self.latitude = latitude
    }
    
    //====================================
    //MARK:- registerUser
    //====================================
    class func registerUser(withName:String,email:String,password:String,phoneNumber: String ,profilePic:UIImage,location: Dictionary<String, Any>,loginHandler: Loginhandler?){
        // [START setup]
        let settings = FirestoreSettings()
        settings.areTimestampsInSnapshotsEnabled = true
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        showLoader()
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil{
                
                user?.user.sendEmailVerification(completion: { (error) in
                    if error == nil{
                        let storageRef = Storage.storage().reference().child("usersProfilePics").child("\((user?.user.uid)!).jpg")
                        let imageData = compressImage(image: profilePic)// Compress Image to speed up the api
                        storageRef.putData(imageData, metadata: nil, completion: { (metadata, err) in
                            if err == nil {
                                storageRef.downloadURL(completion: { (url, error) in
                                    if error == nil{
                                        guard let path = url?.absoluteString else{
                                            return
                                        }
                                        let values: [String: Any] = ["id":(user?.user.uid)!,"name": withName, "email": email, "profilePicLink": path,"phoneNumber":phoneNumber,"location":location]
                                        let credentials : [String: Any] = ["credentials":values]
                                        var ref: DocumentReference? = nil
                                        
                                        ref = db.collection("USERS").document((user?.user.uid)!)
                                        ref?.setData(credentials)
                                        { error in
                                            if let err = error {
                                                print("Error updating document: \(err)")
                                                removeLoader()
                                                self.handleErrors(err: error! as NSError, loginHandler: loginHandler!)
                                                
                                            } else {
                                                removeLoader()
                                                loginHandler!(nil)
                                                print("Document successfully updated")
                                            }
                                            
                                            
                                        }
                                    }else{
                                        removeLoader()
                                        self.handleErrors(err: error! as NSError, loginHandler: loginHandler!)
                                    }
                                })
                                
                            }
                        })
                    }
                    else{
                        removeLoader()
                        
                        self.handleErrors(err: error! as NSError, loginHandler: loginHandler!)
                    }
                })
                
            }
            else{
                removeLoader()
                
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler!)
                
            }
            
        }
    }
    //END Register User
}
