//
//  ViewController.swift
//  pListSample
//
//  Created by 박성은 on 2018. 2. 27..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let loadDataDic = loadPlistData(fileName: "MyInfo")
        print(loadDataDic)
       
        MyUserDefaults.standard.set("sungeun", forKey: "name")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPlistData(fileName: String) -> Dictionary<String, String> {
        // 1. path
        if let path = Bundle.main.path(forResource: fileName, ofType: "plist")
            
        {
            // 2. data 로 로드
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let dic = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
                
                return dic as! Dictionary<String, String>
            } catch {
                print("에러")
            }
        }
        return [:]
    }
    
    func loadPlistForDoc(fileName: String) -> [String:String]? {
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fullPath = rootPath + "/" + fileName + ".plist"
        
        do {
            // fullPath에 파일이 있는지 검사.
            if !FileManager.default.fileExists(atPath: fullPath) {
                // 파일 없을 경우 if문 실행
                
                // 번들에 있는 데이터를 도큐먼트에 복사 -> copy
                if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "plist")
                {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
                }
            }
            
            let data = try Data(contentsOf: URL(fileURLWithPath: fullPath))
            var dic = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:String]
            
            dic.updateValue("wing", forKey: "ID")
            
            let newData = try PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            try newData.write(to: URL(fileURLWithPath: fullPath))
        } catch {
            return nil
        }
        return nil
    }
}

