//
//  ViewController.swift
//  GesturePractice
//
//  Created by sungnni on 2018. 3. 19..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var countLb: UILabel!
    @IBOutlet private weak var pointLb: UILabel!
    
//    @IBOutlet private weak var gesture: UIGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        gesture.delegate = self
    }
}


extension ViewController : UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        pointLb.text = String(describing: touch.location(in: view))
        countLb.text = String(touch.tapCount)
        return true
    }
}

