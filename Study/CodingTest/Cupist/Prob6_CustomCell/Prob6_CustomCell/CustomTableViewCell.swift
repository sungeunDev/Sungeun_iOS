//
//  CustomTableViewCell.swift
//  Prob6_CustomCell
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var personalityLabel: UILabel! //특징
    @IBOutlet weak var characteristicLabel: UILabel! //ex. 낙천적인, 애교있는, 감성적인
    
    var characters: String? {
        didSet {
            awakeFromNib()
        }
    }
    
    override func awakeFromNib() {
        if let character = characters {
            characteristicLabel.text = character
            characteristicLabel.sizeToFit()
        }
    }
}
