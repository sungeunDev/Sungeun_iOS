//
//  PostTableViewCell.swift
//  PostmanExample
//
//  Created by sungnni on 2018. 3. 27..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Alamofire

class PostTableViewCell: UITableViewCell {

    var cellPost: Post?
    
    @IBOutlet var titleLb: UILabel!
    @IBOutlet var dateLb: UILabel!
    @IBOutlet var nameLb: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
//        titleLb.text = cellPost?.title
//        nameLb.text = cellPost?.author.userName
//        dateLb.text = cellPost?.createdDate
//
//        guard let img = cellPost?.imgCover else { return }
//        Alamofire.request(img).responseData { (response) in
//            if response.error == nil {
//                print(response.result)
//                if let data = response.data {
//                    self.imgView.image = UIImage(data: data)
//                }
//            }
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
