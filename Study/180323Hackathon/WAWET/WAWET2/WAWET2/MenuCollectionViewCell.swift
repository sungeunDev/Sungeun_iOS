//
//  MenuCollectionViewCell.swift
//  WAWET2
//
//  Created by sungnni on 2018. 3. 28..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Alamofire

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var menuName: UILabel?
    @IBOutlet var writer: UILabel?
    @IBOutlet var menuImg: UIImageView?
    
    var menu: Menu? {
        didSet {
            menuName?.text = menu?.title
            writer?.text = menu?.writer
            
            Alamofire
                .request((menu?.img)!)
                .responseData { (response) in
                    if response.error == nil {
                        if let data = response.data {
                            self.menuImg?.image = UIImage(data: data)
                        }
                    } else {
                        print(response.error!.localizedDescription)
                    }
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
