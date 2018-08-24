//
//  File.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 7..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation
import UIKit

struct StyleColorSet {
  var id: Int!
  var name: String!
  var color: UIColor!
  var lineColor: UIColor!
  
  init(id: Int, name: String, color: UIColor) {
    self.id = id
    self.name = name
    self.color = color
    self.lineColor = color.darker()!
  }
  
  static var colorArray = [StyleColorSet.faminine, StyleColorSet.modern, StyleColorSet.simple, StyleColorSet.lovely, StyleColorSet.unique,
                           StyleColorSet.missy, StyleColorSet.campus, StyleColorSet.vintage, StyleColorSet.sexy, StyleColorSet.school,
                           StyleColorSet.romantic, StyleColorSet.office, StyleColorSet.luxury, StyleColorSet.hollywood]
  
  static var faminine = StyleColorSet(id: 0, name: "페미닌", color: UIColor(hex: "fac5ff"))
  static var modern = StyleColorSet(id: 1, name: "모던시크", color: UIColor(hex: "f0f0f0"))
  static var simple = StyleColorSet(id: 2, name: "심플베이직", color: UIColor(hex: "ffecb3"))
  static var lovely = StyleColorSet(id: 3, name: "러블리", color: UIColor(hex: "ffcbe8"))
  static var unique = StyleColorSet(id: 4, name: "유니크", color: UIColor(hex: "efe4f6"))
  static var missy = StyleColorSet(id: 5, name: "미시스타일", color: UIColor(hex: "faebd2"))
  static var campus = StyleColorSet(id: 6, name: "캠퍼스룩", color: UIColor(hex: "eef0f9"))
  static var vintage = StyleColorSet(id: 7, name: "빈티지", color: UIColor(hex: "ede3d9"))
  static var sexy = StyleColorSet(id: 8, name: "섹시글램", color: UIColor(hex: "ffcbcb"))
  static var school = StyleColorSet(id: 9, name: "스쿨룩", color: UIColor(hex: "e7ffd4"))
  static var romantic = StyleColorSet(id: 10, name: "로맨틱", color: UIColor(hex: "fefdbb"))
  static var office = StyleColorSet(id: 11, name: "오피스룩", color: UIColor(hex: "e8f3ff"))
  static var luxury = StyleColorSet(id: 12, name: "럭셔리", color: UIColor(hex: "edd2ba"))
  static var hollywood = StyleColorSet(id: 13, name: "헐리웃스타일", color: UIColor(hex: "e8faff"))
  
  static var white = StyleColorSet(id: 100, name: "white", color: UIColor.white)
  
  static func findStyleColorSet(of name: String) -> StyleColorSet {
    for colorSet in StyleColorSet.colorArray {
      if name == colorSet.name {
        return colorSet
      }
    }
    return StyleColorSet.white
  }
}
