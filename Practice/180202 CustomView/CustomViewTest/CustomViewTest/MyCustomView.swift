//
//  MyCustomView.swift
//  CustomViewTest
//
//  Created by 박성은 on 2018. 2. 2..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class MyCustomView: UIView {

    private var testLb: UILabel!
    private var testLb2: UILabel!
    private var imageView: UIImageView!
    private var button: UIButton!
    
    var title: String? {
        get {
            return testLb.text
        }
        set {
            testLb.text = newValue
        }
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
   
    override init(frame: CGRect){
        super.init(frame: frame)
        createView()
    }
    
    func createView() {
        
        testLb = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 300))
        testLb.font = UIFont(name: "NanumBarunpen-Bold", size: 25)
        testLb.text = "hello, World"
        testLb.textColor = .blue
        self.addSubview(testLb)
        
        testLb2 = UILabel(frame: CGRect(x: 0, y: 30, width: self.frame.size.width, height: 300))
        testLb2.text = "hello, World"
        testLb2.textColor = .red
        self.addSubview(testLb2)
        
        let fn = UIFont.fontNames(forFamilyName: "NanumBarunpen")
        print(fn)
        
        imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        imageView.image = #imageLiteral(resourceName: "ryan.png")
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        button = UIButton(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
        button.setTitle("버튼데스", for: .normal)
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        self.addSubview(button)
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)
    {
        button.addTarget(target, action: action, for: controlEvents)
    }
    
    func updateLayout()
    {
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
