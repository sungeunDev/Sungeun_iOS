//
//  ViewController3.swift
//  LifeCycle
//
//  Created by 박성은 on 2018. 2. 5..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITextFieldDelegate {
    
    var textField: UITextField!
    var textField2: UITextField!
    var resultLb: UILabel!
    
    var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBG()
        
        tf = UITextField(frame: CGRect(x: 40, y: 40, width: 200, height: 60))
        tf.delegate = self
        tf.borderStyle = .line
        tf.keyboardType = .numberPad
        tf.keyboardAppearance = .dark
        tf.clearsOnBeginEditing = true
        tf.clearButtonMode = .whileEditing
        
        view.addSubview(tf)
        
        
        textField = UITextField(frame: CGRect(x: 40, y: 145, width: 200, height: 60))
        textField.borderStyle = .roundedRect
        textField.placeholder = "hihihi"
        textField.textColor = .black
        // 텍스트필드에 델리게이트가 누구라고 알려줘야 함.
        textField.delegate = self
        textField.addTarget(self, action: #selector(tfChange(_:)), for: .editingChanged)
        
        // 시작하자마자 텍스트필드가 first responder
        textField.becomeFirstResponder()
        textField.tag = 1
        
        view.addSubview(textField)
        
        
        textField2 = UITextField(frame: CGRect(x: 40, y: 300, width: 200, height: 60))
        textField2.borderStyle = .roundedRect
        textField2.placeholder = "hihihi2"
        textField2.textColor = .black
        textField2.delegate = self
        textField2.tag = 2
        view.addSubview(textField2)
        
        // 텍스트필드에 입력하는 내용은 .text 로 들어감
        //        textField.text = "JO"
        
        resultLb = UILabel(frame: CGRect(x: 40, y: 220, width: 200, height: 60))
        resultLb.textColor = .red
        resultLb.textAlignment = .center
        resultLb.layer.borderWidth = 3
        resultLb.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(resultLb)
        
        let btn = UIButton()
        btn.frame = CGRect(x: 250, y: 145, width: 90, height: 60)
        btn.addTarget(self, action: #selector(btnHandler(_:)), for: .touchUpInside)
        btn.setTitle("눌러봐", for: .normal)
        btn.setTitleColor(.orange, for: .normal)
        btn.backgroundColor = .white
        
        view.addSubview(btn)
    }
    
    @objc func tfChange(_ sender: UITextField)
    {
        print(sender.text)
    }
    
    @objc func btnHandler(_ sender: UIButton)
    {
        textField.resignFirstResponder()
        resultLb.text = textField.text
        textField.text = ""
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        textField.text = "바뀌었나"
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 텍스트 필드를 누르면, first responder가 텍스트 필드가 되는 것.
        // first responder를 없애주면 키보드가 사라짐.
//        textField.resignFirstResponder()
        resultLb.text = textField.text
        textField.text = ""
        if textField == self.textField
        {
            textField2.becomeFirstResponder()
            
        } else if textField == textField2
        {
            textField.resignFirstResponder()
//            textField2 = textField 라고 따로 넣어주지 않아도 becomeFirstResponder가 되면 자동으로 textField가 됨.
        }
        return true
    }
    
    
    func createBG() {
        
        var titleLb: UILabel!
        var imgbg: UIImageView!
//        var btnLeft: UIButton!
//        var btnRight: UIButton!
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.5944439445, blue: 0.3197546467, alpha: 1)
        
        imgbg = UIImageView()
        imgbg.image = #imageLiteral(resourceName: "ggul.jpg")
        imgbg.frame = CGRect(x: 0, y: 270, width: view.frame.size.width, height: 400)
        imgbg.contentMode = .scaleAspectFit
        view.addSubview(imgbg)
        
        titleLb = UILabel()
        titleLb.frame = CGRect(x: 0, y: 60, width: view.frame.size.width, height: 50)
        titleLb.text = "뀰 🍊"
        titleLb.textColor = .white
        titleLb.textAlignment = .center
        titleLb.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        view.addSubview(titleLb)
        
//        btnLeft = UIButton()
//        btnLeft.frame = CGRect(x: 100, y: 550, width: 70, height: 40)
//        btnLeft.setTitle("레드향", for: .normal)
//        btnLeft.setTitleColor(.orange, for: .normal)
//        btnLeft.backgroundColor = .white
//        //        btnLeft.addTarget(self, action: #selector(switchBtn(_:)), for: .touchUpInside)
//        view.addSubview(btnLeft)
//
//        btnRight = UIButton()
//        btnRight.frame = CGRect(x: 200, y: 550, width: 70, height: 40)
//        btnRight.setTitle("천혜향", for: .normal)
//        btnRight.setTitleColor(.orange, for: .normal)
//        btnRight.backgroundColor = .white
//        //        btnRight.addTarget(self, action: #selector(switchBtn(_:)), for: .touchUpInside)
//        view.addSubview(btnRight)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navirgation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
