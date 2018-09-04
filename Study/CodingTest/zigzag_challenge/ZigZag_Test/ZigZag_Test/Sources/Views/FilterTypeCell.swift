//
//  FilterTypeCell.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 2..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class FilterTypeCell: UITableViewCell {
  
  @IBOutlet weak var detailCollectionView: UICollectionView! // 위임받는 대상
}

// MARK: Custom Delegate
extension FilterTypeCell {
  func setCollectionViewDataSourceDelegate
    <D: UICollectionViewDataSource & UICollectionViewDelegate> // 제네릭. D는 DataSource & Deleagate 프로토콜을 준수
    (dataSourceDelegate: D, forRow row: Int) {
    detailCollectionView.delegate = dataSourceDelegate // self(위임을 주는 대상)
    detailCollectionView.dataSource = dataSourceDelegate
    detailCollectionView.tag = row // tag가 곧 콜렉션뷰의 section.
    detailCollectionView.reloadData()
  }
}
