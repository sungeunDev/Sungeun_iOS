//
//  FilterType.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 7..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

struct FilterType {
  static let fullAgeArray =  ["10대", "20대 초반", "20대 중반", "20대 후반", "30대 초반", "30대 중반", "30대 후반"]
  static let fullStyleArray = ["페미닌", "모던시크", "심플베이직", "러블리", "유니크", "미시스타일", "캠퍼스룩",
                               "빈티지", "섹시글램", "스쿨룩", "로맨틱", "오피스룩", "럭셔리", "헐리웃스타일"]
}

struct Filter {
  let title: String
  let detail: [String]
}
