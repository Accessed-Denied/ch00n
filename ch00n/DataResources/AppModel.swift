//
//  LoginResponse.swift
//  ch00n
//
//  Created by MACBOOK on 07/04/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import Foundation

class AppModel: NSObject {
    static let shared = AppModel()
    var loggedInUser: FirebaseUser!
}

struct FirebaseUser: Codable{
    let id: String
    let name: String
    let email: String
    let profilePicLink: String
    let phoneNumber: String
    
    
    enum CodingKeys: String, CodingKey {
        case id,name, email, profilePicLink, phoneNumber
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        profilePicLink = try values.decodeIfPresent(String.self, forKey: .profilePicLink) ?? ""
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber) ?? ""
    }
}
