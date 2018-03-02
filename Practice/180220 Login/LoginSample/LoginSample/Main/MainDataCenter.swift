//
//  MainDataCenter.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 28..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class MainDataCenter {
    static var sharedInstance: MainDataCenter = MainDataCenter()
    
    // FriendInfo.plist 의 리스트
    // 데이터 보호하기 위해 private 설정. 단순히 불러오는 용.
    private var friendList: [[String:String]]!
    
    // let count = MainDataCenter.friendList.count 로 설정해서 값 가져올 수도 있지만 데이터 보호를 위해 리스트를 private로 설정하기 때문에, 데이터 센터에서 처리
    var friendListCount: Int {
        return friendList.count
    }
    // 단순 반환만 해주는 경우, 연산 프로퍼티를 쓰면 좋다
    //    func friendListCount() -> Int {
    //        return friendList.count
    //    }
    
    
    // 모델링화된 리스트
    var friendListModel: [UserModel]
    {
        var list: [UserModel] = []
        for dic in friendList
        {
            list.append(UserModel(with: dic)!)
        }
        return list
    }
 
    
    private init() {
        // 최초 한번만 실행
        loadFriendList()
    }
    
    // 번들에서 FriendInfo.plist 파일 불러오기
    private func loadFriendList() {
        guard let path = Bundle.main.path(forResource: "FriendInfo", ofType: "plist") else {return}
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let propertyList = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        let list = propertyList as! [[String:String]]
        
        friendList = list
    }
    
    
    // 하나하나 모델링 시키기
    func friendData(with index: Int) -> UserModel? {
        let dic = friendList[index]
        return UserModel(with: dic)
    }
    
    
}

// 데이터 모델

//<key>PhoneNumber</key>
//<key>ProfileImage</key>
//<key>MyProfileDescription</key>
//<key>BackgroundImage</key>
//<key>StatusDescription</key>
//<key>Nickname</key>
//<key>Email</key>

struct UserModel {
    var phoneNumber: String
    var profileImgUrl: String
    var profileDescription: String
    var bgImgUrl: String
    var statusDescription: String
    var nickname: String
    var email: String
    
    init?(with dic: [String:String]) {
        guard let phoneNumber = dic["PhoneNumber"] else { return nil }
        guard let profileImgUrl = dic["ProfileImage"] else { return nil }
        guard let profileDescription = dic["MyProfileDescription"] else { return nil }
        guard let bgImgUrl = dic["BackgroundImage"] else { return nil }
        guard let statusDescription = dic["StatusDescription"] else { return nil }
        guard let nickname = dic["Nickname"] else { return nil }
        guard let email = dic["Email"] else { return nil }
        
        self.phoneNumber = phoneNumber
        self.profileImgUrl = profileImgUrl
        self.profileDescription = profileDescription
        self.bgImgUrl = bgImgUrl
        self.statusDescription = statusDescription
        self.nickname = nickname
        self.email = email
    }
}
