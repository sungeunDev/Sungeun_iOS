//
//  Data.swift
//  WAWET
//
//  Created by sungnni on 2018. 3. 23..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import Foundation

class categoryItem {
    var title:String!
    var subTitle:[String]!
    var img: String
    
    
    init(title:String, subTitle:[String], img:String) {
        self.title = title
        self.subTitle = subTitle
        self.img = img
    }
}


