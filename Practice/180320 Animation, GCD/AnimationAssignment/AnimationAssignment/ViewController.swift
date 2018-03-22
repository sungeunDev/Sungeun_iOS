//
//  ViewController.swift
//  AnimationAssignment
//
//  Created by sungnni on 2018. 3. 20..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var recView: UIView!
    var btnClickCheck = false
    
    @IBAction private func btnClick() {
        if btnClickCheck == false {
            viewBounce()
            btnClickCheck = true
        } else {
            removeAnimation()
            btnClickCheck = false
            // btnClickCheck = false로는 바뀌는데, 애니메이션 제거가 안됨.
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//                viewBounce()
        // 다른 뷰로 이동했을 때 error
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        removeAnimation()
        // error
    }

    private func viewBounce() {
        UIView.animate(
            withDuration: 2, delay: 0, options: [.repeat, .curveEaseOut, .allowUserInteraction, .beginFromCurrentState], animations: {
            self.recView.transform = self.recView.transform.translatedBy(x: 0, y: 100)
            self.recView.backgroundColor = .blue
            self.view.backgroundColor = .orange
            
            UIView.animate(
                withDuration: 2, delay: 0, options: [.repeat, .autoreverse, .curveEaseOut, .allowUserInteraction], animations: {
                self.recView.transform = self.recView.transform.translatedBy(x: 0, y: -100)
                self.recView.backgroundColor = .orange
                self.view.backgroundColor = .white
            })
        })
    }
    
    private func removeAnimation() {
        
        recView.layer.removeAllAnimations()
        self.view.layer.removeAllAnimations()
        self.view.layoutIfNeeded()
    }
    
    
}

