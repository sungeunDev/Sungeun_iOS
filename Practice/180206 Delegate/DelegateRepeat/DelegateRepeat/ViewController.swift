//
//  ViewController.swift
//  DelegateRepeat
//
//  Created by 박성은 on 2018. 2. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate, Custom2Delegate, UIScrollViewDelegate {
 
    var sc: UIScrollView!
    var view1: UIView!
    var view2: UIView!
    var view3: UIView!
    var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = CustomView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        customView.delegate = self
        view.addSubview(customView)
        
//        let custom2 = Custom2(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        let custom2 = Custom2(frame: self.view.bounds)
        custom2.delegate = self
        view.addSubview(custom2)
       
        img = UIImageView()
        img.image = #imageLiteral(resourceName: "mountain.jpg")
        
        sc = UIScrollView()
        sc.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        sc.contentSize = CGSize(width: self.view.frame.size.width*3, height: view.frame.size.height)
//        sc.isPagingEnabled = true
        sc.delegate = self
        view.addSubview(sc)
        
        img.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*3, height: self.view.frame.size.height)
        img.contentMode = .scaleAspectFill
        
        
        
        sc.addSubview(img)
        
        
        
//        view1 = UIView()
//        view1.frame = CGRect(x: 0, y: 0, width: sc.frame.size.width, height: view.frame.size.height)
//        view1.backgroundColor = .blue
//        sc.addSubview(view1)
//
//        view2 = UIView()
//        view2.frame = CGRect(x: sc.frame.size.width, y: 0, width: sc.frame.size.width, height: view.frame.size.height)
//        view2.backgroundColor = .red
//        sc.addSubview(view2)
//
//        view3 = UIView()
//        view3.frame = CGRect(x: sc.frame.size.width*2, y: 0, width: sc.frame.size.width, height: view.frame.size.height)
//        view3.backgroundColor = .green
//        sc.addSubview(view3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewFrameChanged(_ custom: Custom2) {
        print("frame changed")
        custom.label.text = "바뀌었따!!!"
    }
    
    func didSelectedBtn(_ customView: CustomView) {
        customView.backgroundColor = .blue
        print("delegate")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sc.setContentOffset(CGPoint(x: 400, y:0), animated: true)
    }

}

