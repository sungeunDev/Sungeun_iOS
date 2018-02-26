//
//  MyTableViewCell.swift
//  NotiPractice
//
//  Created by 박성은 on 2018. 2. 23..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var lb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
