//
//  ShopList.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 2..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

struct ShopList: Codable {
  let week: String
  var list: [Shop]
}

struct Shop: Codable {
  let score: Int
  let name: String
  let url: String
  let style: String
  let age : [Int]
  
  enum CodingKeys: String, CodingKey {
    case score = "0"
    case name = "n"
    case url = "u"
    case style = "S"
    case age = "A"
  }
}
