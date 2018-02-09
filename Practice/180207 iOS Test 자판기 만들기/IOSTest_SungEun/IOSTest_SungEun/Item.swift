//
//  Item.swift
//  IOSTest_SungEun
//
//  Created by 박성은 on 2018. 2. 7..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class Item: UIView {
    
    private var drinkImgView: UIImageView!
    private var drinkPriceLb: UILabel!
    private var drinkBtn: UIButton!
    
    var img: UIImage? {
        get {
            return drinkImgView.image!
        }
        set {
            drinkImgView.image = newValue
        }
    }
    
    var price: String? {
        get {
            return drinkPriceLb.text
        }
        set {
            drinkPriceLb.text = newValue
        }
    }
    
    var index: Int {
        get {
            return drinkBtn.tag
        }
        set {
            drinkBtn.tag = newValue
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
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
        
        drinkBtn = UIButton()
        self.addSubview(drinkBtn)
        
        drinkImgView = UIImageView()
        drinkImgView.contentMode = .scaleAspectFit
        self.addSubview(drinkImgView)
        
        drinkPriceLb = UILabel()
        drinkPriceLb.textAlignment = .right
        drinkPriceLb.textColor = .black
        self.addSubview(drinkPriceLb)
    }
    
    func updateLayer()
    {
        drinkBtn.frame = self.bounds
        drinkImgView.frame = CGRect(x: 0,
                                    y: 0,
                                    width: self.frame.size.width,
                                    height: self.frame.size.height*4/5)
        drinkPriceLb.frame = CGRect(x: 0,
                                    y: self.frame.size.height*4/5,
                                    width: self.frame.size.width,
                                    height: self.frame.size.height/5)
        
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)
    {
        drinkBtn.addTarget(target, action: action, for: controlEvents)
    }
    
}
