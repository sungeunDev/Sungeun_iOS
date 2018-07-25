//
//  CSTabBarController.swift
//  Chapter03-CSTabBar
//
//  Created by sungnni on 2018. 4. 3..
//  Copyright © 2018년 OhTeam. All rights reserved.
//

import UIKit

class CSTabBarController: UITabBarController {

    
    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    let tabView01 = UIView()
    let tabView02 = UIView()
    let tabView03 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isHidden = true
        
        let width = self.view.frame.width
        let height: CGFloat = 50
        let x: CGFloat = 0
        let y = self.view.frame.height - height
        
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = UIColor.blue
        
        self.view.addSubview(self.csView)
        
        
        let tabBtnWidth = self.csView.frame.size.width / 3
        let tabBtnHeight = self.csView.frame.size.height
        
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem02.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem03.frame = CGRect(x: tabBtnWidth*2, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        
        self.addTabBarBtn(btn: self.tabItem01, title: "1번", tag: 0)
        self.addTabBarBtn(btn: self.tabItem02, title: "2번", tag: 1)
        self.addTabBarBtn(btn: self.tabItem03, title: "3번", tag: 2)
        
        
        self.onTabBarItemClick(self.tabItem01)

        
        self.tabView01.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: 3)
        self.tabView01.backgroundColor = UIColor.red
        self.tabView01.alpha = 0
        
        tabItem01.addSubview(tabView01)
        
    }
    
    
    func addTabBarBtn(btn: UIButton, title: String, tag: Int) {
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.yellow, for: .selected)
        
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        
        self.csView.addSubview(btn)
    }
    
    @objc func onTabBarItemClick(_ sender: UIButton) {
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        
        sender.isSelected = true
        self.selectedIndex = sender.tag
        
        self.tabView01.alpha = self.tabItem01.isSelected ? 1 : 0
    }

}
