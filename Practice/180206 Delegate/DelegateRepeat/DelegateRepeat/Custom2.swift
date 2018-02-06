//
//  Custom2.swift
//  DelegateRepeat
//
//  Created by 박성은 on 2018. 2. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class Custom2: UIView {
   
    var label : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        self.backgroundColor = .yellow
        let btn = UIButton()
        btn.frame = self.bounds
        btn.setTitle("bb", for: .normal)
        btn.addTarget(self, action: #selector(changeFrameSize(_:)), for: .touchUpInside)
        self.addSubview(btn)
        
        label = UILabel(frame: CGRect(x: 30, y: 30, width: 30, height: 30))
        label.text = "안녕하세요"
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: Custom2Delegate?
    
    override func layoutSubviews() {
        delegate?.viewFrameChanged(self)
    }
    
    @objc func changeFrameSize(_ sender: UIButton)
    {
        self.frame = CGRect(x: 100, y: 300, width: 200, height: 400)
    }
    
}

protocol Custom2Delegate {
    func viewFrameChanged(_ custom: Custom2)
}
