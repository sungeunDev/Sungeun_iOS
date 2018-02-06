//
//  MyCustomView.swift
//  DelegateSample
//
//  Created by 박성은 on 2018. 2. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class MyCustomView: UIView {

    private var button: UIButton!
    var delegate: MyCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .brown
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        button = UIButton()
        button.addTarget(self, action: #selector(btnHandler(_:)), for: .touchUpInside)
        button.setTitle("hihi", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = self.bounds
        self.addSubview(button)
    }
    
    @objc func btnHandler(_ sender: UIButton)
    {
        print("btn click")
        delegate?.didSelectedMyCustomView(self)
    }
    
}


protocol MyCustomViewDelegate {
    func didSelectedMyCustomView(_ customView: MyCustomView)
}

















