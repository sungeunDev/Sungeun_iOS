//
//  User.swift
//  ServerTest
//
//  Created by sungnni on 2018. 4. 6..
//  Copyright © 2018년 ssungnni. All rights reserved.
//

import Foundation

struct User: Codable {
    let pk: Int
    let userName: String // 이메일
    let email: String // 이메일
    let name: String // 이름
    let phoneNumber: String
    let profileImage: String
    let isFacebookUser: Bool
    
    enum CodingKeys: CodingKey, String {
        case pk
        case userName = "username"
        case email
        case name = "first_name"
        case phoneNumber = "phone_number"
        case profileImage = "img_profile"
        case isFacebookUser = "is_facebook_user"
    }
}
