//
//  SupportExtension.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 3..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation
import UIKit

extension Array {
  func convertToInt() -> Int {
    guard let intArray = self as? [Int] else { return 0 }
    var returnResult = 0
    for (idx, age) in intArray.enumerated() {
      let count = intArray.count - (idx + 1)
      returnResult += age * NSDecimalNumber(decimal: pow(2, count)).intValue
    }
    return returnResult
  }
  
  func countToEqual(to text: String) -> Int {
    guard let stringArray = self as? [String] else { return 0 }
    let filteredArray = stringArray.filter { (string) -> Bool in
      return text.contains(string)
    }
    return filteredArray.count
  }
  
  func convertToStringArray(of type: [String]) -> [String] {
    guard let intArray = self as? [Int],
      intArray.convertToInt() != 0 else { return [] }
    
    let convertedArray = intArray.enumerated().map { (offset, element) -> String in
      if element == 1 {
        return type[offset]
      } else {
        return ""
      }
      }.filter { $0.count != 0 }
    return convertedArray
  }
}


extension UIView {
  func makeCircle() {
    let diameter = self.frame.width
    self.layer.cornerRadius = diameter / 2
    self.clipsToBounds = true
  }
  
  func setRoundedBorder(width: CGFloat, radius: CGFloat) {
    self.layer.cornerRadius = radius
    self.layer.borderWidth = width
    self.layer.borderColor = UIColor(hex: "6e6e6e").cgColor
    self.clipsToBounds = true
  }
  
  func cornerRoundOnlyRight(radius: CGFloat) {
    if #available(iOS 11.0, *){
      self.clipsToBounds = false
      self.layer.cornerRadius = radius
      self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }else{
      let rectShape = CAShapeLayer()
      rectShape.bounds = self.frame
      rectShape.position = self.center
      rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: radius*2, height: radius*2)).cgPath
      self.layer.mask = rectShape
    }
  }
  
  func cornerRoundOnlyLeft(radius: CGFloat) {
    if #available(iOS 11.0, *){
      self.clipsToBounds = false
      self.layer.cornerRadius = radius
      self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }else{
      let rectShape = CAShapeLayer()
      rectShape.bounds = self.frame
      rectShape.position = self.center
      rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: radius*2, height: radius*2)).cgPath
      self.layer.mask = rectShape
    }
  }
  
  func cornerRoundAll(radius: CGFloat) {
    if #available(iOS 11.0, *){
      self.clipsToBounds = false
      self.layer.cornerRadius = radius
      self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
    }else{
      let rectShape = CAShapeLayer()
      rectShape.bounds = self.frame
      rectShape.position = self.center
      rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .bottomRight, .topLeft, .bottomLeft], cornerRadii: CGSize(width: radius*2, height: radius*2)).cgPath
      self.layer.mask = rectShape
    }
  }
}


extension UIColor {
  
  static let mainColor = UIColor(hex: "f71b65")
  static let subColor = UIColor(hex: "47cbcf")
  
  convenience init(hex: String) {
    let scanner = Scanner(string: hex)
    scanner.scanLocation = 0
    var rgbValue: UInt64 = 0
    scanner.scanHexInt64(&rgbValue)
    
    let r = (rgbValue & 0xff0000) >> 16
    let g = (rgbValue & 0xff00) >> 8
    let b = rgbValue & 0xff
    
    self.init(
      red: CGFloat(r) / 0xff,
      green: CGFloat(g) / 0xff,
      blue: CGFloat(b) / 0xff, alpha: 1
    )
  }
  
  func darker(by percentage: CGFloat = 30.0) -> UIColor? {
    return self.adjust(by: -1 * abs(percentage) )
  }
  
  func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
    var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
    if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
      return UIColor(red: min(red + percentage/100, 1.0),
                     green: min(green + percentage/100, 1.0),
                     blue: min(blue + percentage/100, 1.0),
                     alpha: alpha)
    } else {
      return nil
    }
  }
}
