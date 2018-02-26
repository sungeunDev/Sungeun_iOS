//
//  InstaTableViewCell.swift
//  TableView2
//
//  Created by 박성은 on 2018. 2. 22..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class InstaTableViewCell: UITableViewCell {

    @IBOutlet var idLb: UILabel!
    @IBOutlet var textLb: UILabel!
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var contentsImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
