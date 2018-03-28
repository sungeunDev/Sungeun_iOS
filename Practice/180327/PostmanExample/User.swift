//
//  User.swift
//  PostmanExample
//
//  Created by sungnni on 2018. 3. 27..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import Foundation

struct User: Codable {
    let user: UserInfo
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case token
    }
}

struct UserInfo: Codable {
    let pk : Int
    //        let password: String
    let userName: String
    let firstName: String?
    let lastName: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case pk
        //            case password
        case userName = "username"
        case firstName = "first_name"
        case lastName = "last_name"
        case email
    }
}

//{
//    "user": {
//        "pk": 1,
//        "username": "lhy",
//        "first_name": "",
//        "last_name": "",
//        "email": "dev@lhy.kr"
//    },
//    "token": "d3e60437ef417c427f43ac6c09e93b8f86d13356"
//}

