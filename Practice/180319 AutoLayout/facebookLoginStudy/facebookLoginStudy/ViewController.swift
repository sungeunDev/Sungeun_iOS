//
//  ViewController.swift
//  facebookLoginStudy
//
//  Created by sungnni on 2018. 3. 19..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Firebase
//import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    //    let loginManager: FBSDKLoginManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        // 페북 제공 로그인 기능
        //        // 버튼 생성
        //        let loginButton = FBSDKLoginButton()
        //        // 읽기 권한 추가
        //        loginButton.readPermissions = ["public_profile","email","user_friends"]
        //        loginButton.center = view.center
        //        view.addSubview(loginButton)
        
        login()
        getFBUserData()
    }
    
    // custom Login
    func login() {
        //        FBSDKLoginManager.init().logIn(readPermissions: ["public_profile","user_friends","email"], viewController: self) { (loginResult) in
        //            switch loginResult {
        //            case .failed(let error):
        //                print(error)
        //            case .cancelled:
        //                print("유저 캔슬")
        //            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
        //                print("로그인 성공")
        //                print(grantedPermissions)
        //                print(declinedPermissions)
        //                print(accessToken)
        //            }
        //        }
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                print(fbloginresult)
                
                if fbloginresult.grantedPermissions != nil {
                    print(fbloginresult.grantedPermissions)
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        fbLoginManager.logOut()
                    }
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
//                    self.dict = result as! [String : AnyObject]
                    print(result!)
//                    print(self.dict)
                }
            })
        }
    }
}

