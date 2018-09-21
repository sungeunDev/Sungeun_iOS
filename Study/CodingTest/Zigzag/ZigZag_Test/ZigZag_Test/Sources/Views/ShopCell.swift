//
//  ShopCell.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 2..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit
import Kingfisher

class ShopCell: UITableViewCell {
  
  @IBOutlet weak var indexLabel: UILabel!
  @IBOutlet private weak var shopImageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var firstStyleLabel: InsetLabel!
  @IBOutlet private weak var secondStyleLabel: InsetLabel!
  @IBOutlet private weak var ageLabel: UILabel!
  @IBOutlet weak var rankingView: UIView!
  
  var index: Int? {
    willSet {
      indexLabel.text = "\(newValue!)"
      if newValue! >= 1000 {
        indexLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
      } else {
        indexLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
      }
    }
  }
  
  var source: Shop? {
    willSet {
      if let source = newValue {
        nameLabel.text = source.name
        ageLabel.text = ageGrouping(of: source.age)
        updateUI(str: source.style)
        
        let resource = ImageResource(downloadURL: URL(string: imageUrl(of: source.url))!, cacheKey: imageUrl(of: source.url))
        shopImageView.kf.setImage(with: resource)
      }
    }
  }
  
  var selectedFilterStyle: [String]? {
    willSet {
      guard let filterStyle = newValue else { return }
      selected(of: filterStyle)
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    shopImageView.makeCircle()
    ageLabel.setRoundedBorder(width: 0.5, radius: 4)
  }
}


// MARK: - Update UI
extension ShopCell {
  func updateUI(str: String) {
    firstLabelUpdate(of: str)
    secondLabelUpdate(of: str)
  }
  
  func firstLabelUpdate(of str: String) {
    let array = str.components(separatedBy: ",")
    let firstColorSet = StyleColorSet.findStyleColorSet(of: array[0])
    firstStyleLabel.text = array[0]
    firstStyleLabel.textColor = UIColor(hex: "4E4E4E")
    firstStyleLabel.backgroundColor = firstColorSet.color
    firstStyleLabel.layer.borderColor = firstColorSet.lineColor.cgColor
    firstStyleLabel.layer.borderWidth = 0.5
    if array.count == 2 {
      firstStyleLabel.cornerRoundOnlyLeft(radius: 4)
      firstStyleLabel.clipsToBounds = true
    } else {
      firstStyleLabel.cornerRoundAll(radius: 4)
      firstStyleLabel.clipsToBounds = true
    }
  }
  
  func secondLabelUpdate(of str: String) {
    let array = str.components(separatedBy: ",")
    if array.count == 2 {
      let secondColorSet = StyleColorSet.findStyleColorSet(of: array[1])
      secondStyleLabel.text = array[1]
      secondStyleLabel.textColor = UIColor(hex: "4E4E4E")
      secondStyleLabel.backgroundColor = secondColorSet.color
      secondStyleLabel.cornerRoundOnlyRight(radius: 4)
      secondStyleLabel.layer.borderWidth = 0.5
      secondStyleLabel.layer.borderColor = secondColorSet.lineColor.cgColor
      secondStyleLabel.clipsToBounds = true
    } else {
      secondStyleLabel.text = ""
      secondStyleLabel.layer.borderColor = UIColor.clear.cgColor
      secondStyleLabel.backgroundColor = UIColor.clear
    }
  }
  
  func selected(of filter: [String]) {
    let stringOfFilter = filter.reduce("") { $0 + "," + $1 } 
    if !stringOfFilter.contains(firstStyleLabel.text!) {
      firstStyleLabel.layer.borderColor = UIColor.lightGray.cgColor
      firstStyleLabel.backgroundColor = UIColor.white
      firstStyleLabel.textColor = UIColor.lightGray
    } else {
      firstLabelUpdate(of: source!.style)
    }
    if !stringOfFilter.contains(secondStyleLabel.text!) {
      secondStyleLabel.layer.borderColor = UIColor.lightGray.cgColor
      secondStyleLabel.backgroundColor = UIColor.white
      secondStyleLabel.textColor = UIColor.lightGray
    } else {
      secondLabelUpdate(of: source!.style)
    }
  }
  
}



// MARK: - Data 처리
extension ShopCell {
  func ageGrouping(of ages: [Int]) -> String {
    let comparedNum = ages.convertToInt()
    var result: [String] = []
    
    if (comparedNum & 0b1000000) != 0 {
      result.append("10대")
    }
    if (comparedNum & 0b0111000) != 0 {
      result.append("20대")
    }
    if (comparedNum & 0b0000111) != 0 {
      result.append("30대")
    }
    
    if result.count == 3 {
      return "모두"
    } else {
      return String(result.reduce(""){ $0 + $1 + " " }.dropLast())
    }
  }
  
  func imageUrl(of url: String) -> String {
    var shopName = ""
    let urlArray = url.components(separatedBy: ".")
    if urlArray[0].contains("www") {
      shopName = urlArray[1]
    } else {
      shopName = urlArray[0].components(separatedBy: "//")[1]
    }
    return "https://cf.shop.s.zigzag.kr/images/\(shopName).jpg"
  }
  
}
