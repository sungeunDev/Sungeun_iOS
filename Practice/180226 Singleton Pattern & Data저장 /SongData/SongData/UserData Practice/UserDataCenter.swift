//
//  UserDataCenter.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 26..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class UserDataCenter {
    
    static var main: UserDataCenter = UserDataCenter()
    
    var isLogin: Bool?
    private var userList: [String] = []
    
    func login(userID: String, userPw: String) -> Bool {
        
        return true
    }
}
