//
//  ViewController.swift
//  DigitalFrame
//
//  Created by sungnni on 2018. 3. 26..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var btn: UIButton!
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var slider: UISlider!
    
    @IBAction private func startAction() {
        if imgView.isAnimating {
            imgView.stopAnimating()
            btn.setTitle("start", for: .normal)
        } else {
            imgView.animationDuration = Double(slider.value)
            imgView.startAnimating()
            // duration 설정 후, start 코드 작성해야 함. 반대로 할 경우 실행 안됨.
            
            btn.setTitle("stop", for: .normal)
        }
    }
    
    // value Changed 로 연결해야 함.
    @IBAction private func sppedSliderAction() {
        imgView.animationDuration = Double(slider.value)
        // 15개 - 1초에 1개씩 돔
        // duration 값이 바뀌면 애니메이션이 멈춤
        imgView.startAnimating()
        btn.setTitle("stop", for: .normal)
        label.text = String(format: "%.2f", slider.value)
    }
    
    override func viewDidLoad() {
        
        let cuteImages = [UIImage(named: "1.jpg"),
                          UIImage(named: "2.jpg"),
                          UIImage(named: "3.jpg"),
                          UIImage(named: "4.jpg"),
                          UIImage(named: "5.jpg"),
                          UIImage(named: "6.jpg"),
                          UIImage(named: "7.jpg"),
                          UIImage(named: "8.jpg"),
                          UIImage(named: "9.jpg"),
                          UIImage(named: "10.jpg"),
                          UIImage(named: "11.jpg"),
                          UIImage(named: "12.jpg"),
                          UIImage(named: "13.jpg"),
                          UIImage(named: "14.jpg"),
                          UIImage(named: "15.jpg")]
        
        imgView.animationImages = cuteImages as? [UIImage]
        label.text = String(format: "%.2f", slider.value)
        
    }

}

