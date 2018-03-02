//
//  MainCell.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 28..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLb: UILabel!
    @IBOutlet var statusLb: UILabel!
    
    var cellData: UserModel? {
        willSet {
            if let data = newValue {
                imgView.image = UIImage(named: data.profileImgUrl)
                nameLb.text = data.nickname
                statusLb.text = data.statusDescription
            }
        }
    }
    
    // == viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        // 이미지 원으로 만들기 & 자르기
        imgView.round()
        imgView.clipsToBounds = true
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        imgView.layer.borderWidth = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension UIImageView {
    open func round() {
        self.layer.cornerRadius = self.frame.size.width/2
    }
}
