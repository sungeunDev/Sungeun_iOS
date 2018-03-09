//
//  SecondViewController.swift
//  GustureSample
//
//  Created by 박성은 on 2018. 3. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var tf: UITextField!
    var picker: UIPickerView!
    var toolbar: UIToolbar!
    var doneBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // picker는 tf.inputview로 들어가서 키보드 사이즈(view.width)로 자동 프레임 설정
        picker = UIPickerView()
        tf.inputView = picker
        
        doneBtn = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(doneBtnAction(_:)))
        // 악세사리 뷰는 height만 적용됨.
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        toolbar.setItems([doneBtn], animated: false)
        tf.inputAccessoryView = toolbar
        
    
        
//        true >> frame / false >> autoLayout
//        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
//        오토레이아웃 코드 작성방법
//        toolbar.addConstraint(NSLayoutConstraint(item: , attribute: , relatedBy: , toItem: , attribute: , multiplier: , constant: ))
    }
    
    @objc func doneBtnAction(_ sender: UIBarButtonItem) {
        tf.resignFirstResponder()
    }
    
    
}


