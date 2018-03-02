//
//  SettingDataCenter.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 28..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

struct Settings_Ver1 {
    
    var sectionTitle: String
    var data: [[String:String]] = []

    init?(with dic: [String:Any?]){
        guard let sectionTitle = dic["SectionTitle"] as? String else {return nil}
        
        guard var data = dic["Data"] as? [[String:Any]] else { return nil }
        self.sectionTitle = sectionTitle
        
        for index in 0..<data.count {
            
            guard let cellStyle = data[index]["CellStyle"] as? String else {return nil}
            guard let content = data[index]["Content"] as? String else {return nil}
            
            data[index].updateValue(cellStyle, forKey: "CellStyle")
            data[index].updateValue(content, forKey: "Content")
        }
    }
}
