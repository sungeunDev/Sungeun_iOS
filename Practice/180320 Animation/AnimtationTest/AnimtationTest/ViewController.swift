//
//  ViewController.swift
//  AnimtationTest
//
//  Created by sungnni on 2018. 3. 20..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var viewSample: UIView!
    @IBOutlet weak var viewSampleBottomContraint: NSLayoutConstraint!
    
    @IBOutlet private weak var imgViewSample: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    func imgAnimation() {
        imgViewSample.animationImages = [#imageLiteral(resourceName: "a1136.jpg"), #imageLiteral(resourceName: "bod_mainImg_01.jpg"), #imageLiteral(resourceName: "sample-5_0.jpg")]
        
        // 하이라이트 됐을 경우, 다른 이미지 보여지게 할 수 있음.
        imgViewSample.highlightedAnimationImages = [#imageLiteral(resourceName: "a1136.jpg"), #imageLiteral(resourceName: "bod_mainImg_01.jpg"), #imageLiteral(resourceName: "sample-5_0.jpg")]
        imgViewSample.isHighlighted = true
        
        imgViewSample.animationDuration = 2 // n초 동안 이미지 다 보여줌.
        imgViewSample.animationRepeatCount = 2
        
        imgViewSample.startAnimating()
    }
    
    func viewAnimation() {
        UIView.animate(withDuration: 3, animations: {
            self.viewSampleBottomContraint.constant += 30
            self.view.layoutIfNeeded()
            
            /***************************************************
             ㅁ view.setNeedsLayout()
             -. 런루프가 돌 때, 레이아웃 변경점이 생길 경우, 변경함(런루프 중 레이아웃 구성하는 시점에 작동).
             -. setNeeds가 필요한지 아닌지만 알려주는 역할 -> Bool값. UI업데이트 할 때 이것도 껴서 한번에 해라.
             
             ㅁ view.layoutIfNeeded()
             -. autolayout 변경시 반드시 호출해야 적용됨. / 강제로 레이아웃 잡거나, 런루프가 인식하지 못하는 경우.
             -. 런루프한테 레이아웃을 바꿔야 하는 작업이 있다고 알려줌. 지금 당장 바꿔라!
             ** 주의 : setNeedsLayout이 true일 때만 layoutIfNeeded 호출됨
             ***************************************************/
        }) { finish in
            if finish {
                UIView.animate(withDuration: 2, animations: {
                    self.viewSampleBottomContraint.constant -= 30
                    self.view.layoutIfNeeded()
                    print( finish )
                })} else {
                print( finish )
            }
        }
    }
    
    
    func repeatViewAnimation() {
        UIView.animate(
            withDuration: 3,
            delay: 0,
            options: [.repeat, .autoreverse, .curveEaseInOut],
            animations: {
                self.viewSampleBottomContraint.constant += 50
                self.view.layoutIfNeeded()
        }, completion: nil)
        // 반복하는 애니메이션의 경우 뷰가 없어지거나, 강제로 애니메이션 종료인 경우에만 completion -> false 되며 종료
    }
    
    func springDamp() {
        UIView.animate(withDuration: 5, delay: 1, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: [.curveEaseInOut], animations: {
            //            self.viewSampleBottomContraint.constant += 100
            self.viewSample.frame.origin.y -= 200
            self.view.layoutIfNeeded()
        }, completion: nil) // + other animtation
    }
    
    func animateKeyFrame() {
        var imgs = [#imageLiteral(resourceName: "a1136.jpg"), #imageLiteral(resourceName: "bod_mainImg_01.jpg"), #imageLiteral(resourceName: "sample-5_0.jpg")]
        UIView.animateKeyframes(withDuration: 10, delay: 0, options: [.beginFromCurrentState], animations: {
            var startTime: Double = 0
            let durations: Double = Double(imgs.count / 3)
            
            for i in 0..<imgs.count {
                UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: durations, animations: {
                    
                    // 어떻게 번갈아가면서 나오게 하지?!
                    self.imgViewSample.image = imgs[i]
                    self.view.layoutIfNeeded()
                })
                startTime += durations
            }
        })
    }
}


