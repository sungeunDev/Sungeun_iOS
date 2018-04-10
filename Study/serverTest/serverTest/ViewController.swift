//
//  ViewController.swift
//  ServerTest
//
//  Created by sungnni on 2018. 4. 6..
//  Copyright © 2018년 ssungnni. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let url = "http://myrealtrip.hongsj.kr/"
    
    @IBOutlet private weak var email: UITextField!
    @IBOutlet private weak var pw: UITextField!
    @IBOutlet private weak var pw2: UITextField!
    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction private func btnClick() {
        let url = self.url + "sign-up/"
        
        let text = "https://api.lhy.kr/members/signup/"
        
        print(url)
        
        guard let email = email.text, let name = name.text, let phone = phone.text, let pw = pw.text, let pw2 = pw2.text else {return}
        
        let params: Parameters = [
            "email": email,
            "first_name": name,
            "phone_number": phone,
            "password" : pw,
            "password2" : pw2,
            "img_profile" : ""
        ]
        
        let params2: Parameters = [
            "username" : name,
            "password" : pw,
            "email" : email
        ]
        
        let params3: Parameters = [
//            "pk": "사용자 id",
            "username": "starfg@hanmail.net",
            "email": "starfg@hanmail.net",
            "first_name": "박성은",
            "phone_number": "01058350602",
//            "img_profile": "프로필 이미지",
//            "is_facebook_user": false
        ]
        
//        print(params)
        
//        Alamofire
//            .request(text, method: .post, parameters: params2)
//            .validate()
//            .responseJSON { (response) in
//                print(response.response?.statusCode)
//                print(response.result.value)
//
//                if let responseValue = response.result.value as! [String:Any]? {
//                    print(responseValue.keys)
//                }
//            }
        
        print(params)
        Alamofire
            .request(url, method: .post, parameters: params)
            .responseJSON { (response) in
                print(response.response?.statusCode)
                
                if let responseValue = response.result.value as! [String:Any]? {
                    print(responseValue.keys)
                    print(responseValue.values)
                }
        }
        
//            .responseData { (response) in
//                switch response.result {
//                case .success(let value):
//                    let userInfo = try! JSONDecoder().decode(User.self, from: value)
//                    print(userInfo)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//        }
    
        
    }

}

