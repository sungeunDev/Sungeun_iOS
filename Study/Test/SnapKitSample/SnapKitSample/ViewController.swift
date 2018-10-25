//
//  ViewController.swift
//  SnapKitSample
//
//  Created by Ari on 25/10/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        updateLayout()
//        updateLayoutTest2()
        updateLayoutTest3()
    }
    
    override func updateViewConstraints() {
//        print("----------------< updateViewConstraints >----------------")
//        self.view2.snp.updateConstraints { (make) in
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
//
        super.updateViewConstraints()
    }
    
    func updateLayout() {
        view1.backgroundColor = .black
        view1.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(100)
        }
        
        view2.backgroundColor = .red
        view2.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.width.equalTo(self.view.frame.width)
            make.center.equalTo(self.view)
        }
        
        self.view.bringSubviewToFront(view1)
    }
    
    func updateLayoutTest2() {
        view1.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        view2.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
//                make.edges.equalTo(self.view.safeAreaLayoutGuide)
                
                make.edges.equalTo(self.view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            } else {
                make.top.equalTo(self.topLayoutGuide.snp.bottom)
                make.leading.equalToSuperview()
                make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
                make.trailing.equalToSuperview()
            }
        }
    }
    
    var topConstraint: Constraint? = nil
    
    struct Padding {
        var top: CGFloat = 0
        var bottom: CGFloat = 0
        var left: CGFloat = 0
        var right: CGFloat = 0
    }
    
    let padding = Padding(top: 40, bottom: 40, left: 30, right: 30)
    
    func updateLayoutTest3() {
        print("----------------< updateLayoutTest3 >----------------")
        view1.snp.makeConstraints { (make) in
            self.topConstraint = make.top.equalToSuperview().offset(padding.top).constraint
            make.left.equalToSuperview().offset(padding.left)
            
            make.width.height.equalTo(100)
        }
        print("----------------< view1: \(view1.frame) >----------------")
    }
    
    @IBAction func deactivateLayoutAction() {
        self.topConstraint?.deactivate()
    }
    
    @IBAction func changeLayoutAction() {
//        self.topConstraint?.update(offset: 5)
        
        self.view1.snp.remakeConstraints { (make) in
            make.size.equalTo(CGSize(width: 200, height: 200)).labeled("view1 size constraint")

            make.top.left.equalTo(20).labeled("view1 top left constraint")
        }
        
//        self.view1.snp.makeConstraints { (make) in
//            make.size.equalTo(CGSize(width: 200, height: 200)).labeled("view1 size constraint")
//            make.top.left.equalTo(20).labeled("view1 top left constraint")
//        }
//        print("----------------< view1: \(view1.frame) >----------------")
    }
    
}

