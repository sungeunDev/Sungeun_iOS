//
//  ViewController.swift
//  btnAnimationPractice
//
//  Created by sungnni on 2018. 3. 20..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 스토리보드에서도 버튼을 컬렉션에 넣을 수 있음!!!
    @IBOutlet var btnCollections: [UIButton]!
    
    // 이런 방식은 동적으로 관리하기 어렵! 배열 안에 버튼 넣는걸로.
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    var clickCheck = false
    
    @IBOutlet weak var ver2Btn1: UIButton!
    @IBOutlet weak var ver2Btn2: UIButton!
    @IBOutlet weak var ver2Btn3: UIButton!
    @IBOutlet weak var ver2Btn4: UIButton!
    @IBOutlet weak var ver2Btn5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 혼자 해보기
    @IBAction func bt1Clcik() {
        btn1.round()
        btn2.round()
        btn3.round()
        btn4.round()
        btn5.round()
        loadViewIfNeeded()
        
        if clickCheck == false {
            UIView.animate(withDuration: 0.7, delay: 0, options: [.curveEaseIn], animations: {
                let margin:CGFloat = 15
                let size = self.btn1.frame.width
                var gap = margin + size
                
                self.btn2.center.y -= gap
                gap += gap
                self.btn3.center.y -= gap
                gap += margin + size
                self.btn4.center.y -= gap
                gap += margin + size
                self.btn5.center.y -= gap
            }, completion: nil)
            clickCheck = true
        } else {
            UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
                self.btn2.center.y = self.btn1.center.y
                self.btn3.center.y = self.btn1.center.y
                self.btn4.center.y = self.btn1.center.y
                self.btn5.center.y = self.btn1.center.y
            }, completion: nil)
            clickCheck = false
        }
    }
}

extension UIButton {
    open func round() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}
