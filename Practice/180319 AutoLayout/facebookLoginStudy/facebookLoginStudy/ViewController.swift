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
    
    @IBOutlet private weak var profileImg: UIImageView!
    
    //    let loginManager: FBSDKLoginManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        // 페북 제공 로그인 기능
        //        // 버튼 생성
                let loginButton = FBSDKLoginButton()
        //        // 읽기 권한 추가
                loginButton.readPermissions = ["public_profile","email","user_friends"]
                loginButton.center = view.center
    
                view.addSubview(loginButton)
        

    }
    
    @IBAction private func tokenBtn() {
        if let token = FBSDKAccessToken.current() {
            
            print(token)
            print(token.appID)
            print(token.userID)
            print(token.tokenString)
            
//            let tok = FBSDKAccessToken(tokenString: <#T##String!#>, permissions: <#T##[Any]!#>, declinedPermissions: <#T##[Any]!#>, appID: <#T##String!#>, userID: <#T##String!#>, expirationDate: <#T##Date!#>, refreshDate: <#T##Date!#>)
//            print(tok)
//            print(tok?.appID)
//            print(tok?.userID)
//
//            print(tok?.isEqual(to: token))
//            print(tok?.tokenString)
//            print(tok?.permissions)
            
        } else {
            print("토큰 없음")
        }
    }
    
    @IBAction private func fbsession() {
        
        let profile = FBSDKProfile.current()
        print(profile?.userID)
        print(profile?.name)
        print(profile?.linkURL)
        print(profile?.imageURL(for: FBSDKProfilePictureMode.normal, size: profileImg.bounds.size))
        
        if let url = profile?.imageURL(for: FBSDKProfilePictureMode.normal, size: profileImg.bounds.size) {
            let data = try? Data(contentsOf: url)
            profileImg.image = UIImage(data: data!)!
        }
    }
    
    
    
    
    
    
    
    
    
    // custom Login
    @IBAction func login() {
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

