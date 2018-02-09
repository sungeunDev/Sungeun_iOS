//
//  CustomSampleRepeat.swift
//  CustomViewTest
//
//  Created by 박성은 on 2018. 2. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class CustomSampleRepeat: UIView {
    
    private var bgImgView: UIImageView?
    private var btn: UIButton?
    private var btnLb: UILabel?
    
    var img: UIImage? {
        get {
            return bgImgView?.image
        }
        set {
            bgImgView?.image = newValue
        }
    }
    
    var index: Int = 0
    {
        didSet {
            btn?.tag = index
        }
    }
    
    
    var title: String? {
        get {
            return btnLb?.text
        }
        set {
            btnLb?.text = newValue
        }
    }
    
    var btnTitle: String? {
        get {
            return title
        }
        set {
            title = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
        updateLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create()
    {
        btn = UIButton()
        btn?.setTitle(title, for: .normal)
        self.addSubview(btn!)
        
        bgImgView = UIImageView()
        self.addSubview(bgImgView!)
        
        
        
        btnLb = UILabel()
        btnLb?.backgroundColor = .orange
        self.addSubview(btnLb!)
        
        
    }
    
    func updateLayer()
    {
        bgImgView?.frame = self.bounds
        btn?.frame = self.bounds
        btnLb?.frame = CGRect(x: 50, y: 50, width: self.frame.size.width, height: 50)
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)
    {
        btn?.addTarget(target, action: action, for: controlEvents)
    }
}
