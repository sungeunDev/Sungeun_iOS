//
//  CustomView.swift
//  DelegateRepeat
//
//  Created by 박성은 on 2018. 2. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class CustomView: UIView {

    private var btn: UIButton!
    var delegate: CustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .orange
        create()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create()
    {
        btn = UIButton()
        btn.frame = self.bounds
        btn.setTitle("orange", for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        self.addSubview(btn)
        
    }
    
    @objc func btnClick(_ sender: UIButton)
    {
//        print("nana")
        delegate?.didSelectedBtn(self)
    }
}

protocol CustomViewDelegate {
    func didSelectedBtn(_ customView: CustomView)
}
