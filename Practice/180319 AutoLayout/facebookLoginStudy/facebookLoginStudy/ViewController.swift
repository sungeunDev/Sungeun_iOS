//
//  ViewController.swift
//  facebookLoginStudy
//
//  Created by sungnni on 2018. 3. 19..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Firebase
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    func fbLoginBtnAction() {
        
        let loginBtn = LoginButton(coder: NSCoder)
    
        loginBtn.center = view.center
        loginBtn.delegate = self
        view.addSubview(loginBtn)
    }
}

