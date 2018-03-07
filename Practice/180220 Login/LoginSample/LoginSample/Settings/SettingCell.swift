//
//  SettingCell.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 28..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var textLb: UILabel!
    @IBOutlet weak var versionLb: UILabel!
    
    @IBOutlet var `switch` : UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
