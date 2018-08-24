//
//  FilterTypeView.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 3..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class InsetLabel: UILabel {

  // properties가 없다면,
  @IBInspectable var sideInset: CGFloat = 2.0
  @IBInspectable var upDownInset: CGFloat = 3.0
  var customRadius: CGFloat = 4
  
  // extension으로도 가능하지 않을까. 라는 의견.
  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets.init(top: upDownInset, left: sideInset, bottom: upDownInset, right: sideInset)
    super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
  }
  
  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + sideInset * 2,
                  height: size.height + upDownInset * 2)
  }
  
  func setCornerRadius() {
    self.layer.cornerRadius = customRadius
    self.clipsToBounds = true
  }
}


