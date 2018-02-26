//
//  SignUpViewController.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 20..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    // 1. tf 2개 (id / pw)
    var idTf: UITextField!
    var pwTf: UITextField!
    var pwRepeatTf: UITextField!
    
    // 2. btn - signUp
    var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        createUI()
        updateLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // create UI
    // step 1. UI 만들기
    private func createUI() {
        idTf = UITextField()
        idTf.placeholder = "아이디를 입력해주세요"
        idTf.borderStyle = .line
        idTf.tag = 10
        idTf.textAlignment = .center
        idTf.delegate = self
        idTf.keyboardType = .URL
        view.addSubview(idTf)
        
        // 패스워드 텍스트필드
        pwTf = UITextField()
        pwTf.placeholder = "비밀번호를 입력해주세요"
        pwTf.borderStyle = .line
        pwTf.tag = 11
        pwTf.textAlignment = .center
        pwTf.delegate = self
        pwTf.keyboardType = .numberPad
        // TF 입력시, 입력내용 가려질 수 있게 가려줌
        pwTf.isSecureTextEntry = true
        
        let keyboardToorbar = UIToolbar()
        keyboardToorbar.sizeToFit()
        let item = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.textFieldDone(_:)))
        keyboardToorbar.items = [item, doneBtn]
        
        pwTf.inputAccessoryView = keyboardToorbar
        view.addSubview(pwTf)
        
        // 패스워드 재입력 텍스트필드
        pwRepeatTf = UITextField()
        pwRepeatTf.placeholder = "비밀번호를 재입력해주세요"
        pwRepeatTf.borderStyle = .line
        pwRepeatTf.tag = 12
        pwRepeatTf.textAlignment = .center
        pwRepeatTf.delegate = self
        pwRepeatTf.keyboardType = .numberPad
        pwRepeatTf.isSecureTextEntry = true
        pwRepeatTf.inputAccessoryView = keyboardToorbar
        view.addSubview(pwRepeatTf)
        
        // 회원가입 버튼
        signUpBtn = UIButton(type: .custom)
        signUpBtn.setTitle("회원가입", for: .normal)
        signUpBtn.setTitleColor(.black, for: .normal)
        signUpBtn.setTitleColor(.gray, for: .highlighted)
        signUpBtn.addTarget(self, action: #selector(touchUpInsideSignUpBtn(_:)), for: .touchUpInside)
        view.addSubview(signUpBtn)
    }
    
    // step 2. UI Frame 잡기
    private func updateLayout() {
        var offsetY: CGFloat = 150
        let inputFrameWidth = view.frame.size.width / 2
        let offsetX = view.frame.size.width / 2 - inputFrameWidth / 2
        idTf.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTf.frame.size.height + 10
        pwTf.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += pwTf.frame.size.height + 10
        pwRepeatTf.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += pwTf.frame.size.height + 30
        
        signUpBtn.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
    }
    
    @objc private func touchUpInsideSignUpBtn(_ sender: UIButton) {
        if checkInputValid()
        {
            let id: String = idTf.text!
            let pw: String = pwTf.text!
            
            let userInfo:[String:String] = ["user_id":id,"user_pw":pw]
            
            if var userList = UserDefaults.standard.array(forKey: USER_LIST) as? [[String:String]]
            {
                userList.append(userInfo)
                UserDefaults.standard.set(userList, forKey: USER_LIST)
            }else
            {
                var userList:[[String:String]] = []
                userList.append(userInfo)
                UserDefaults.standard.set(userList, forKey: USER_LIST)
            }
            //gotoMain
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    // 적절한 값을 입력했는지 체크 - 패스워드 길이 & 재입력한 패스워드와 동일한지
    private func checkInputValid() -> Bool {
        if pwTf.text!.count > 4 {
            if pwTf.text == pwRepeatTf.text {
                return true
            } else
            {
                let alertVC : UIAlertController = UIAlertController(title: "문제", message: "비밀번호를 동일하게 입력해 주세요.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
                })
                alertVC.addAction(action)
                self.present(alertVC, animated: true, completion: nil)
                return false
            }
        } else
        {
            let alertVC : UIAlertController = UIAlertController(title: "문제", message: "비밀번호를 네자리 이상 입력해주세요.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
            })
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 10
        {
            pwTf.becomeFirstResponder()
        } else if textField.tag == 11
        {
            pwRepeatTf.becomeFirstResponder()
        } else
        {
            pwRepeatTf.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    @objc func textFieldDone(_ sender: UIBarButtonItem) {
        view.endEditing(true)
    }
}
