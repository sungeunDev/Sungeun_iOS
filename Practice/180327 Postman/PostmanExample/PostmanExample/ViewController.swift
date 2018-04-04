//
//  ViewController.swift
//  PostmanExample
//
//  Created by sungnni on 2018. 3. 27..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Alamofire

var userInfo: User?
class ViewController: UIViewController {
    
    @IBOutlet weak var loginIDTextField: UITextField!
    @IBOutlet weak var loginPWTextField: UITextField!
    @IBOutlet weak var singUpIDTextField: UITextField!
    @IBOutlet weak var singUpPWTextField: UITextField!
    @IBOutlet weak var signUpEmailTextField: UITextField!
    
    let basicUrl = "https://api.lhy.kr/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        이미지 파일을 PNG로 변환시켜줌.
        //        UIImagePNGRepresentation(<#T##image: UIImage##UIImage#>)
        
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let signUpUrl = basicUrl + "members/signup/"
        
        guard let id = singUpIDTextField.text else { return }
        guard let pw = singUpPWTextField.text else { return }
        guard let email = signUpEmailTextField.text else { return }
        
        let params: Parameters = [
            "username" : id,
            "password" : pw,
            "email" : email
        ]
        
        Alamofire
            .request(signUpUrl, method: .post, parameters: params)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    let userInfo = try! JSONDecoder().decode(User.self, from: value)
                    print(userInfo.user.email!)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        let loginUrl = basicUrl + "members/auth-token/"
        
        guard let id = loginIDTextField.text else { return }
        guard let pw = loginPWTextField.text else { return }
        
        let params: Parameters = [
            "username" : id,
            "password" : pw
        ]

        
                Alamofire
                    .request(loginUrl, method: .post, parameters: params)
                    .responseJSON { (response) in
                        
                        print(response.response?.statusCode)
                        // JSON으로 받는 경우, JSON파일이 들어오는건 모두 success 처리해버림 ㅠㅜ
//                        print(response.error)
                        
//                        if response.result.isFailure {
//                            print("success")
//                        } else {
                            if let responseValue = response.result.value as! [String:Any]? {
                                print(responseValue.keys)
                            }
                        }
        
        
//        Alamofire
//            .request(loginUrl, method: .post, parameters: params)
//                    .responseData { (response) in
//                        switch response.result {
//                        case .success(let value):
//                            let result = try? JSONDecoder().decode(User.self, from: value)
//                            userInfo = result
//                            dump(userInfo)
//
//                            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                            let nextVC = storyBoard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
//                            self.navigationController?.pushViewController(nextVC, animated: true)
//
//                        case .failure(let error):
//                            print(error.localizedDescription)
//                            dump(error)
//                            dump(error.localizedDescription)
//
//
//                        }
//                }
    }
}

