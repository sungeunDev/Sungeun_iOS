//
//  CustomSampleRepeat.swift
//  CustomViewTest
//
//  Created by 박성은 on 2018. 2. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class CustomSampleRepeat: UIView {
    
    var bgView: UIView!
    var btn: UIButton!
    var btnLb: UILabel!
    
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
        bgView = UIView()
        btn = UIButton()
        btnLb = UILabel()
    }
    
    func updateLayer()
    {
        
    }
  

    
    
}
