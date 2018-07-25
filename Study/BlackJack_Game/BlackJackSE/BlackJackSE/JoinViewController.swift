//
//  JoinViewController.swift
//  BlackJackSE
//
//  Created by 박성은 on 2018. 2. 19..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

let UserInfoKey = "블랙잭유저"
class JoinViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var idTf: UITextField!
    @IBOutlet weak var pwTf: UITextField!
        
    @IBOutlet weak var gameLvBeginner: UIButton!
    @IBOutlet weak var gameLvLowGrade: UIButton!
    @IBOutlet weak var gameLvMiddleGrade: UIButton!
    @IBOutlet weak var gameLvMaster: UIButton!
    var selectBtn: UIButton?
    var gameLv: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 블랙잭 실력 버튼 클릭 액션
        gameLvBeginner.addTarget(self, action: #selector(levelCheck(_:)), for: .touchUpInside)
        gameLvLowGrade.addTarget(self, action: #selector(levelCheck(_:)), for: .touchUpInside)
        gameLvMiddleGrade.addTarget(self, action: #selector(levelCheck(_:)), for: .touchUpInside)
        gameLvMaster.addTarget(self, action: #selector(levelCheck(_:)), for: .touchUpInside)
        
        // 내비 타이틀
        self.navigationItem.title = "회원가입"
        // 텍스트필드 리턴
        nameTf.delegate = self
        idTf.delegate = self
        pwTf.delegate = self
        
        pwTf.isSecureTextEntry = true
    }
    
    /// ID 중복 검사(idCheck == true : 중복 아이디 존재)를 거쳐 회원가입 진행
    /// - Parameter sender: 회원가입 버튼
    @IBAction func joinBtnAction(_ sender: Any) {
        if var userList = UserDefaults.standard.array(forKey: UserInfoKey) as? [[String:String]]
        {
            var idCheck = false
            for index in 0..<userList.count
            {
                if userList[index]["id"] == idTf.text
                {
                    idCheck = true
                    break
                }
            }
            
            if idCheck == true
            {
                let idCheckAlert = UIAlertController(title: "ID 중복", message: "동일한 아이디가 존재합니다. 다른 ID를 입력해주세요.", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                })
                idCheckAlert.addAction(confirmAction)
                self.present(idCheckAlert, animated: true, completion: nil)
            } else
            {
                // 모든 정보를 입력했는지 확인.
                if let name = nameTf.text, let id = idTf.text, let pw = pwTf.text, let gameLv = gameLv
                {
                    var userList = [[:]]
                    let userInfo: [String:String] = ["name":name, "id": id, "pw":pw, "gameLv":gameLv]
                    userList.append(userInfo)
                    UserDefaults.standard.set(userList, forKey: UserInfoKey)
                    joinCompleteAlert()
                } else
                {
                    joinFaultAlert()
                }
            }
        } else
        {
            if let name = nameTf.text, let id = idTf.text, let pw = pwTf.text, let gameLv = gameLv
            {
                var userList = [[:]]
                let userInfo: [String:String] = ["name":name, "id": id, "pw":pw, "gameLv":gameLv]
                userList.append(userInfo)
                UserDefaults.standard.set(userList, forKey: UserInfoKey)
                joinCompleteAlert()
            } else
            {
                joinFaultAlert()
            }
        }
    }
    
    // 회원가입 실패 Alert - 모든 정보 입력 안한 경우
    func joinFaultAlert()
    {
        let joinNilAlert = UIAlertController(title:"빈 칸을 입력해주세요.", message: "모든 정보를 입력 및 선택해야 회원가입이 완료됩니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
        })
        joinNilAlert.addAction(confirmAction)
        self.present(joinNilAlert, animated: true, completion: nil)
    }
    
    // 회원가입 완료 Alert
    func joinCompleteAlert()
    {
        let joinCompleteAlert = UIAlertController(title: "회원가입 완료", message: "가입이 완료되었습니다. 확인 버튼을 누르면 로그인 화면으로 돌아갑니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
        self.navigationController?.popViewController(animated: true)
        })
        joinCompleteAlert.addAction(confirmAction)
        self.present(joinCompleteAlert, animated: true, completion: nil)
    }
    
    // 블랙잭 실력 버튼 선택시, 중복 선택 불가.
    // 한 버튼 선택하면 다른 버튼 선택 해제.
    @objc func levelCheck(_ sender: UIButton) {
        if sender.isSelected == false
        {
            if let selectBtn = selectBtn
            {
                selectBtn.isSelected = false
                selectBtn.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            }
            sender.isSelected = true
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            selectBtn = sender
        } else
        {
            sender.isSelected = false
            sender.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            selectBtn = nil
        }
        
        // 블랙잭 실력에 따라 버튼 태그값 지정 >> 문자로 회원 정보에 저장
        gameLvBeginner.tag = 0
        gameLvLowGrade.tag = 1
        gameLvMiddleGrade.tag = 2
        gameLvMaster.tag = 3
        
        switch selectBtn?.tag {
        case 0?:
            gameLv = "초보"
        case 1?:
            gameLv = "하수"
        case 2?:
            gameLv = "중수"
        case 3?:
            gameLv = "고수"
        default:
            print("level Check switch error")
        }
    }
    
    @IBAction func printAction(_ sender: Any) {
        if let userList = UserDefaults.standard.array(forKey: UserInfoKey) as? [[String:String]]
        {
            print(userList)
        } else
        {
            print("userList nil")
        }
    }
    
    @IBAction func removeListAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: UserInfoKey)
        print("remove Succees")
    }
    
    // 텍스트필드 리턴
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.clearButtonMode = .whileEditing
        var nextTf: UITextField?
        switch textField {
        case nameTf:
            nextTf = idTf
        case idTf:
            nextTf = pwTf
        case pwTf:
            nextTf = nil
            pwTf.resignFirstResponder()
        default:
            print("textFieldShouldReturn Error")
        }
        nextTf?.becomeFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
}
