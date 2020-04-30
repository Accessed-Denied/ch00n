//
//  DownloadUsers.swift
//  ch00n
//
//  Created by MACBOOK on 26/04/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import Firebase

func downloadAllUsers(exceptID: String, completion: @escaping (User) -> Swift.Void) {
        // [START setup]
        let settings = FirestoreSettings()
        settings.areTimestampsInSnapshotsEnabled = true
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        db.collection("USERS")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                       
                       let data = document.data()
                       let id = document.documentID
                        guard let credentials = data["credentials"] as? [String: Any] else{
                            return
                        }
                        if id != exceptID {
                            let name = credentials["name"]!
                            let email = credentials["email"]!
                            let location = credentials["location"] as! [String: Any]
                            let latitude = location["latitude"]
                            let longitude = location["longitude"]
                            let phoneNumber = credentials["phoneNumber"]
                            let link = URL.init(string: credentials["profilePicLink"]! as! String)
                            URLSession.shared.dataTask(with: link!, completionHandler: { (data, response, error) in
                                if error == nil {
                                    let profilePic = UIImage.init(data: data!)
                                    let user = User.init(name: name as! String, email: email as! String, id: id, phnNumber: phoneNumber as! String, profilePic: profilePic!, latitude: latitude!, longitude: longitude!)
                                    completion(user)
                                }
                            }).resume()
                        }
                    }
                }
            }
}//Download all users
