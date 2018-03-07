//
//  SecondViewController.swift
//  TabbarSample
//
//  Created by 박성은 on 2018. 3. 5..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tabBarItem.badgeValue = "하세요"
//        self.tabBarItem.selectedImage = #imageLiteral(resourceName: "ico_character_con.png")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // should는 did 직전. false를 주면 셀렉트 안됨.
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}

