//
//  SettingModel.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 3. 1..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

// 데이터 센터의 역할
// 1. Setting.plist를 Bundle에서 불러오기 >> 실행될 때 최초 1회
//  ㄴ init에서 함수 실행
//
// 2. 데이터 모델로 변환하기
//  ㄴ 하나씩 변환시킬 수도 있고 (item0, item1, item2)
//  ㄴ 전체 리스트를 변환시킬 수도 있음 ([item0, item1, item2]
//      ㄴ 이 경우 연산프로퍼티(get)을 쓰면 좋음
//
// 3. 기타 필요한 변수 생성
//  ㄴ ex. list.count(cell row 생성시 필요)
//          ㄴ 단순 값만 리턴하는 경우, 함수로 만들어도 되고, 연산 프로퍼티 이용해도 됨.

class SettingDataCenter {
    
    static var standard: SettingDataCenter = SettingDataCenter()
    
    private var settingList: [[String:Any]]!
    var settingListCount: Int {
        return settingList.count
    }
    
    var settingListModel: [SettingDataModel] {
        var list: [SettingDataModel] = []
        for dic in settingList {
            list.append(SettingDataModel(with: dic)!)
        }
        return list
    }
    
    private init() {
        loadSettingList()
    }
    
    func loadSettingList() {
        let bundlePath = Bundle.main.path(forResource: "Settings", ofType: "plist")
        guard let path = bundlePath else { return }
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let propertyList = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        let dic = propertyList as! [[String:Any]]
        settingList = dic
    }
}

struct SettingDataModel {
    var sectionTitle: String
    var datas: [DataModel] = []
    
    init?(with dic: [String:Any]) {
        guard let title = dic["SectionTitle"] as? String else {return nil}
        self.sectionTitle = title
        
        if let dataList = dic["Data"] as? [[String:String]] {
            for dataDic in dataList {
                if let dataModel = DataModel(with: dataDic) {
                    self.datas.append(dataModel)
                }
            }
        }
    }
}

struct DataModel {
    var cellStyle: String
    var content : String
    
    init?(with dic: [String:String]) {
        guard let style = dic["CellStyle"] else {return nil}
        guard let content = dic["Content"] else {return nil}
        
        self.cellStyle = style
        self.content = content
    }
}

