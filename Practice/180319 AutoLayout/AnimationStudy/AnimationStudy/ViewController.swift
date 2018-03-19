//
//  ViewController.swift
//  AnimationStudy
//
//  Created by sungnni on 2018. 3. 19..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var sampleLabel: UILabel!
    @IBOutlet private weak var samplebutton: UIButton!
    @IBOutlet private weak var sampleTransformLabel: UILabel!
    
    var a: CGFloat = 3.14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fadeInLabel()
//        btnSpringWithDumping()
    }
    
    @IBAction private func fadeInLabel() {
        sampleLabel.alpha = 0.0
        UIView.animate(withDuration: 1.0, animations: {
            self.sampleLabel.alpha = 1.0
        })
    }
    
    @IBAction private func btnSpringWithDumping() {
        samplebutton.center.y = self.view.frame.height + 100
        
        UIView.animate(withDuration: 3.0, delay: 1.0, usingSpringWithDamping: 10.0, initialSpringVelocity: 10.0,
                       options: UIViewAnimationOptions.curveEaseIn, animations: {
                        
            self.samplebutton.center.y = self.view.frame.height / 2
        }, completion: nil)
    }
    
    @IBAction private func transformLabel() {
        UIView.animate(withDuration: 1.0, animations: {
//            self.sampleTransformLabel.transform = CGAffineTransform(translationX: 100, y: 300)
            self.sampleTransformLabel.transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if self.a == 3.14 {
                self.sampleTransformLabel.transform = CGAffineTransform(rotationAngle: self.a)
                self.a = 0
            } else {
                self.sampleTransformLabel.transform = CGAffineTransform(rotationAngle: self.a)
                self.a = 3.14
            }
            
        }, completion: nil)
        
    }

}

