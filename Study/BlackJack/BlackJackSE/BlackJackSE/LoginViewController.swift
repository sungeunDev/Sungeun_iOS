//
//  LoginViewController.swift
//  BlackJackSE
//
//  Created by 박성은 on 2018. 2. 13..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idTf: UITextField!
    @IBOutlet weak var pwTf: UITextField!
    var idReal: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "블랙잭 게임"
    }
    
    // 로그인 버튼 클릭
    @IBAction func loginBtnAction(_ sender: Any) {
        if let id = idTf, let pw = pwTf
        {
            idReal = id.text!
            if let userList = UserDefaults.standard.array(forKey: UserInfoKey) as? [[String:String]]
            {
                var loginCheck = false
                for index in 0..<userList.count
                {
                    if userList[index]["id"] == id.text && userList[index]["pw"] == pw.text
                    {
                        print("login complete")
                        loginCheck = true
                        break
                    }
                }
                
                if loginCheck == true
                {
                    // 로그인 성공
                    let loginCompleteAlert = UIAlertController(title:"로그인 되었습니다.", message: "게임을 즐겨주세요.", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                        // 로그인 완료 화면으로 이동
                        let loginComplteVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginCompleteViewController")
                        self.navigationController?.pushViewController(loginComplteVC!, animated: true)
                    })
                    loginCompleteAlert.addAction(confirmAction)
                    self.present(loginCompleteAlert, animated: true, completion: nil)
                } else
                {
                    // 아이디 & 비밀번호 틀림.
                    let loginFailAlert = UIAlertController(title:"로그인에 실패하였습니다.", message: "아이디, 비밀번호를 재입력해 주세요.", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "확인", style: .destructive, handler: { (action) in
                    })
                    loginFailAlert.addAction(confirmAction)
                    self.present(loginFailAlert, animated: true, completion: nil)
                }
            } else
            {
                // 회원정보 없음
                let loginFailAlert = UIAlertController(title:"로그인에 실패하였습니다.", message: "회원정보가 없습니다. 회원가입을 해주세요.", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                })
                loginFailAlert.addAction(confirmAction)
                self.present(loginFailAlert, animated: true, completion: nil)
            }
        } else
        {
            // 아이디 & 비밀번호 입력 안함
            let loginFailAlert = UIAlertController(title:"로그인에 실패하였습니다.", message: "아이디와 비밀번호를 입력해 주세요.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
            })
            loginFailAlert.addAction(confirmAction)
            self.present(loginFailAlert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.clearButtonMode = .whileEditing
        textField.resignFirstResponder()
        if textField == idTf
        {
            pwTf.becomeFirstResponder()
        }
        return true
    }
   
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
}
