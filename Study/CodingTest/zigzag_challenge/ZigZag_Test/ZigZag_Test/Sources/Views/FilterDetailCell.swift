//
//  FilterDetailCell.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 2..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class FilterDetailCell: UICollectionViewCell {

  @IBOutlet weak var detailLabel: UILabel!
  let cellColor = [UIColor.subColor, UIColor.mainColor]
  
  var section: Int? {
    willSet {
      self.layer.borderColor = cellColor[newValue!].cgColor
      self.detailLabel.textColor = cellColor[newValue!]
    }
  }
  
  var isClicked: Bool = false {
    willSet {
      guard let section = section else { return }
      
      if newValue {
        self.backgroundColor = cellColor[section]
        self.detailLabel.textColor = UIColor.white
      } else {
        self.backgroundColor = UIColor.white
        self.detailLabel.textColor = cellColor[section]
      }
    }
  }
  
  // 코드가 산재되니까 스토리보드를 잘 안쓰게 됨.
  // 스토리보드를 쓸 때는 코드를 써야만 하는 경우들이 생기니까 코드가 산재됨. -> 디버깅이 어려움
  override func awakeFromNib() {
    self.layer.borderWidth = 1
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
  }
}
