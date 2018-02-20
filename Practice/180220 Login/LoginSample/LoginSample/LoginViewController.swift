//
//  LoginViewController.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 20..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // 1. tf 2개 (id / pw)
    var idTf: UITextField!
    var pwTf: UITextField!
    
    // 2. btn 2개 (login / signUp)
    var loginBtn: UIButton!
    var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        
        createUI()
        updateLayout()
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
        
        loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.setTitleColor(.gray, for: .highlighted)
        loginBtn.addTarget(self, action: #selector(touchUpInsideLoginBtn(_:)), for: .touchUpInside)
        view.addSubview(loginBtn)
        
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
        var offsetX = view.frame.size.width / 2 - inputFrameWidth / 2
        idTf.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += idTf.frame.size.height + 10
        pwTf.frame = CGRect(x: offsetX, y: offsetY, width: inputFrameWidth, height: 50)
        offsetY += pwTf.frame.size.height + 30
        
        loginBtn.frame = CGRect(x: offsetX, y: offsetY, width: (inputFrameWidth-10)/2, height: 50)
        offsetX += loginBtn.frame.size.width + 10
        signUpBtn.frame = CGRect(x: offsetX, y: offsetY, width: (inputFrameWidth-10)/2, height: 50)
    }
    
    @objc private func touchUpInsideLoginBtn(_ sender: UIButton) {
        if checkInputValid()
        {
            print("로그인")
        }
    }
    
    @objc private func touchUpInsideSignUpBtn(_ sender: UIButton) {
        print("회원가입")
    }
    
    // 적절한 값을 입력했는지 체크(패스워드 길이)
    private func checkInputValid() -> Bool {
        if pwTf.text!.count > 4 {
            return true
        } else
        {
            let alertVC : UIAlertController = UIAlertController(title: "문제", message: "비밀번호를 네자리 이상 입력해주세요.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
            })
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 10
        {
            pwTf.becomeFirstResponder()
        } else
        {
            pwTf.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        print("End Edit")
    }
    
    @objc func textFieldDone(_ sender: UIBarButtonItem) {
        view.endEditing(true)
    }
    
}
