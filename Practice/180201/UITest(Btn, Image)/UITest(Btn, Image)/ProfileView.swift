//
//  ProfileView.swift
//  UITest(Btn, Image)
//
//  Created by 박성은 on 2018. 2. 1..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    var profileImageView: UIImageView!
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        profileImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 40, height: 40))
        self.addSubview(profileImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
