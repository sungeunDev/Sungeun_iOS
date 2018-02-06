//
//  CustomView.swift
//  CustomViewTest
//
//  Created by 박성은 on 2018. 2. 2..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    private var logo: UIImageView!
    private var logoBtn: UIButton!
    private var profileLb: UILabel!
    private var descriptionLb: UILabel!
    
    var profileTitle: String? {
        get {
            return profileLb.text
        }
        set {
            profileLb.text = newValue
        }
    }
    
    var descriptionTitle: String? {
        get {
            return descriptionLb.text
        }
        set {
            descriptionLb.text = newValue
        }
    }
    
    var img: UIImage {
        get {
            return logo.image!
        }
        set {
            logo.image = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create() {
        
        logo = UIImageView(frame: CGRect(x: 10, y: 10, width: self.frame.size.height-20, height: self.frame.size.height-20))
        logo.layer.borderWidth = 1
        logo.layer.borderColor = UIColor.darkGray.cgColor
        logo.image = #imageLiteral(resourceName: "kakaoFrd.png")
        logo.contentMode = .scaleAspectFit
        self.addSubview(logo)
        
        logoBtn = UIButton(frame: CGRect(x: 10, y: 10, width: self.frame.size.height-20, height: self.frame.size.height-20))
        self.addSubview(logoBtn)
        
        let offset = 15 + (self.frame.size.height-30) + 15
        profileLb = UILabel(frame: CGRect(x: offset, y: 5, width: self.frame.size.width-offset, height: self.frame.size.height/3))
        profileLb.text = "이름을 넣어주세요."
        profileLb.textAlignment = .left
        profileLb.font = UIFont(name: "NanumSquareRoundEB", size: 20)
        self.addSubview(profileLb)
        
        descriptionLb = UILabel(frame: CGRect(x: offset, y: 45, width: self.frame.size.width-offset-15, height: self.frame.size.height*0.6))
        descriptionLb.text =
        """
        이름을 입력해주세요.
        왼쪽의 사진을 누르면 다른 사진이 나옵니다.
        """
        descriptionLb.textAlignment = .left
        descriptionLb.font = UIFont(name: "NanumSquareRoundR", size: 15)
        descriptionLb.numberOfLines = 4
        descriptionLb.lineBreakMode = .byTruncatingTail
        descriptionLb.backgroundColor = UIColor.lightGray
        self.addSubview(descriptionLb)
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents)
    {
        logoBtn.addTarget(target, action: action, for: controlEvents)
    }
    
}
