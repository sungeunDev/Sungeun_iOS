//
//  ViewController.swift
//  DelegateSample
//
//  Created by 박성은 on 2018. 2. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyCustomViewDelegate, UITextFieldDelegate {
    
    var tf : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTF()
        let myCustomView = MyCustomView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        myCustomView.delegate = self
        self.view.addSubview(myCustomView)
    }
    
    func createTF() {
        tf = UITextField(frame: CGRect(x: 100, y: 200, width: 330, height: 60))
        tf.borderStyle = .roundedRect
        tf.placeholder = "여기가 쓰는 곳"
        tf.delegate = self
        tf.clearButtonMode = .whileEditing
        view.addSubview(tf)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("textField Delegate Test")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear")
        return true
    }
    
    func didSelectedMyCustomView(_ customView: MyCustomView) {
        print("아이템을 선택했습니다.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

