//
//  Data.swift
//  WAWET2
//
//  Created by sungnni on 2018. 3. 28..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import Foundation

struct Category: Codable {
    let href: String
    let title: String
    
//    init(href:String , title:String) {
//        self.href = href
//        self.title = title
//    }
}

struct Menu: Codable {
    let href: String
    let title: String
    let writer: String
    let img: String
}

struct Recipe: Decodable {    
    let text: String?
    var image: String?
}
