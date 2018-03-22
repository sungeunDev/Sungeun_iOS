//
//  ThirdViewController.swift
//  AnimationAssignment
//
//  Created by sungnni on 2018. 3. 20..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit


class ThirdViewController: ViewController {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var gesture: UITapGestureRecognizer!
    
    @IBAction private func btnAction() {
        print("btnCllicked")
        shake()
    }
    
    func shake() {
        
//        let shake = CAKeyframeAnimation(keyPath: "position")
        let shake = CABasicAnimation(keyPath: "position.x")
        shake.duration = 0.4
        shake.repeatCount = 2
        shake.autoreverses = true
//
//        let fromPoint = CGPoint(x: textField.center.x - 5, y: textField.center.y)
//        let fromValue = NSValue(cgPoint: fromPoint)
//
//        let toPoint = CGPoint(x: textField.center.x + 5, y: textField.center.y)
//        let toValue = NSValue(cgPoint: toPoint)
        
        let fromPoint = textField.frame.origin.x
//        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = textField.frame.origin.x - 5
//        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromPoint
        shake.toValue = toPoint
        
        textField.layer.add(shake, forKey: "shake")
//        self.view.layer.add(shake, forKey: "shake")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfSetting()

        gesture.addTarget(self, action: #selector(gestureSetting(_:)))
        self.view.addGestureRecognizer(gesture)
    }
    
    private func tfSetting() {
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
    }
    
    @objc private func gestureSetting(_ gesture: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }

}
