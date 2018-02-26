//
//  MyTableViewCell.swift
//  TableView2
//
//  Created by 박성은 on 2018. 2. 22..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var cartegoryLb: UILabel!
    @IBOutlet var contentLb: UILabel!
    @IBOutlet var priceLb: UILabel!
    
    func priceTextColorChange(cartegory: String) {
        switch cartegory {
        case "식비":
            imgView.image = #imageLiteral(resourceName: "dinner-icon.png")
            priceLb.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case "교통비":
            imgView.image = #imageLiteral(resourceName: "location-icon1.png")
            priceLb.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case "쇼핑":
            imgView.image = #imageLiteral(resourceName: "shopping-icon.png")
            priceLb.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case "저축":
            imgView.image = #imageLiteral(resourceName: "currency-icon.png")
            priceLb.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        default:
            print("error")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.addSubview(imgView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
