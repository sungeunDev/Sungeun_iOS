//
//  SettingModel.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 28..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

struct SettingModel_Ver2 {
    let title: String
    var datas: [CellData] = []
    
    init?(with dic: [String:Any?]) {
        guard let title = dic["SectionTitle"] as? String else { return nil }
        self.title = title
        
        // 파일명 Data인 List 추가하기
        if let dataList = dic["Data"] as? [[String:String]] {
            
            // dataList의 배열을 self.datas에 append
            // for dic in dataList -> dataList의 [0], [1], [2] 셀이 순서대로 dic에 대입
            for dic in dataList {
                
                // dic이 CellData에 적합한 값을 넣었는지 check & 모델링
                if let dataDic = CellData(with: dic){
                    
                // dic을 모델로 바꾼 값을 append
                self.datas.append(dataDic)
                }
            }
        }
    }
}

struct CellData {
    let cellStyle: String
    let content: String
    
    init?(with dic: [String:String]){
        guard let style = dic["CellStyle"] else { return nil }
        guard let content = dic["Content"] else { return nil }
        
        self.cellStyle = style
        self.content = content
    }
}


