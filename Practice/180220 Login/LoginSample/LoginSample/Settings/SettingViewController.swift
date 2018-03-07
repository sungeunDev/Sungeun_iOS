//
//  SettingViewController.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 28..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var settingTableView: UITableView!
    var settingList: [SettingDataModel] = SettingDataCenter.standard.settingListModel
    var settingCount = SettingDataCenter.standard.settingListSectionCount
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList[section].datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basicCell = settingTableView.dequeueReusableCell(withIdentifier: "basicCell") as! SettingCell
        
        let detailCell = settingTableView.dequeueReusableCell(withIdentifier: "detailCell") as! SettingCell
        
        let switchCell = settingTableView.dequeueReusableCell(withIdentifier: "switchCell") as! SettingCell
        
        let cellName = settingList[indexPath.section].datas[indexPath.row].cellStyle
        let celldata = settingList[indexPath.section].datas[indexPath.row].content
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        
        switch cellName {
        case .Detail:
            detailCell.textLb.text = celldata
            return detailCell
        case .Basic:
            basicCell.textLb.text = celldata
            if celldata == "버전정보" {
                basicCell.versionLb.text = version
                basicCell.textLb.textColor = .black
            }
            return basicCell
        case .Switch:
            switchCell.textLb.text = celldata
            return switchCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingList[section].sectionTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    } 
}

