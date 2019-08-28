//
//  FirstTabBarViewController.swift
//  CustomTabbar
//
//  Created by Sungeun Park on 20/05/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit

class FirstTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func presentTabbarContainerView() {
        let tabbar = self.tabBarController as! CustomTabBarController
        tabbar.addSecondVC()
    }
    
    @IBAction func selectColor() {
        let tabbar = self.tabBarController as! CustomTabBarController
        tabbar.selectColor(.purple)
    }
}
