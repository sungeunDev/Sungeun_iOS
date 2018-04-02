//
//  SecondViewController.swift
//  facebookLoginStudy
//
//  Created by sungnni on 2018. 4. 1..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SecondViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let loginBtn: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["public_profile","email","user_friends"]
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(loginBtn)
        loginBtn.center = view.center
        loginBtn.delegate = self
        
        if (FBSDKAccessToken.current()) != nil {
            fetchProfile()
        }
    }
    
    func fetchProfile() {
        print("fetchProfile")
        
        let param = ["field": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: param).start { (connection, result, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            print(result!)
            
            if let fbEmail = (result as AnyObject)["name"] as? String {
                print(fbEmail)
            }
            
            guard let result2 = result as? NSDictionary else {
                print("result is not NSDictionary")
                return
            }
            
            print("result is NSDictionary")
            
//            print(data)
            
            
//            if let email = result!["email"]  {
//                print(email)
//            }
        }
    }
    
    
    
    
    // required
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        fetchProfile()
        print("completed login")
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("loginButtonDidLogOut")
    }

    
    // other delegate
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        print("loginButtonWillLogin")
        return true
    }
}
