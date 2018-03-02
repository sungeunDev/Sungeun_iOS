//
//  MyUserDefault.swift
//  pListSample
//
//  Created by 박성은 on 2018. 2. 27..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation
class MyUserDefaults {
    
    // 싱글턴 인스턴스 생성
    static var standard: MyUserDefaults = MyUserDefaults()
    // Bundle에 있는 plist file name
    private let plistName = "MyInfo"
    // User Document에 만들 plist file name
    let fileName = "MyUserDefault.plist"
    
    // fullPath는 계속 쓰게 될거라서 프로퍼티 선언 후 init에 저장
    private var fileURL: URL
    private var fullPath: String
    private init() {
        let directoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        fullPath = directoryPath + "/" + fileName
        fileURL = URL(fileURLWithPath: fullPath)
    }
    
    // 해당 키값의 value 리턴
    func object(forKey defaultName: String) -> Any?
    {
        if !FileManager.default.fileExists(atPath: fullPath){
            return nil
        }
        
        // 경로 있으면 데이터 불러오기
        let data = try! Data(contentsOf: fileURL)
        
        // 데이터를 딕셔너리 형태로 변환
        let propertyList = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        let dic = propertyList as! [String:Any?]
        // 딕셔너리 중 키값이 defaultName에 해당하는 값 불러오기
        
        if let value = dic[defaultName] {
            return value
        } else {
            return nil
        }
    }
    
    
    
    // 해당 키값에 value 저장
    func set(_ value: Any?, forKey defaultName: String)
    {
        let dic: Dictionary<String, Any?>!
        
        // 폴더 안에 plist file 있는지 확인
        if FileManager.default.fileExists(atPath: fullPath){
            // 있는 경우, data -> dictionary 불러오기 & dic 저장
            let data = try! Data(contentsOf: fileURL)
            let propertyList = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
            dic = propertyList as! [String:Any?]
            dic.updateValue(value, forKey: defaultName)
        } else
        {
            // 없는 경우, dic 생성
            dic = [defaultName:value]
        }
        // dic -> data 변환 & data 저장
        let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
        try? newData?.write(to: URL(fileURLWithPath: fullPath))
    }
    
    
    
    // 제거
    func removeObject(forKey defaultName: String)
    {
        // 다큐먼트 폴더 내 plist 파일 경로 찾기 >> FileManager
        if FileManager.default.fileExists(atPath: fullPath)
        {
            // 있으면 data를 통해 dic 불러오기
            let data = try! Data(contentsOf: fileURL)
            var dic = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:Any?]
            
            // dic에 해당 키값 value 제거
            dic.removeValue(forKey: defaultName)
            
            // dic -> data 변환 & 저장
            let newData = try! PropertyListSerialization.data(fromPropertyList: dic as Any, format: .xml, options: 0)
            try! newData.write(to: fileURL)
        }
    }
}
