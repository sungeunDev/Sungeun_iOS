//
//  FilterViewController.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 2..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
  
  @IBOutlet weak var titleTableView: UITableView!
  
  let filterType: [Filter] = [Filter(title: "연령대",
                                     detail: ["10대", "20대 초반", "20대 중반", "20대 후반", "30대 초반", "30대 중반", "30대 후반"]),
                              Filter(title: "스타일",
                                     detail: ["페미닌", "모던시크", "심플베이직", "러블리", "유니크", "미시스타일", "캠퍼스룩",
                                              "빈티지", "섹시글램", "스쿨룩", "로맨틱", "오피스룩", "럭셔리", "헐리웃스타일"])]
  var selectedFilterType: [[Int]] = []
  
  //Properties About Layout
  private let collectionViewCellHeight: CGFloat = 30
  private let collectionViewLineSpace: CGFloat = 10
  private let numberOfItemsInRow = [4, 3]
  // Metric Class를 만들어서 static으로 활용할 수 있게끔.
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setNeedsStatusBarAppearanceUpdate()
    makeEmptySelectedFilter()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
  
  override func viewDidLayoutSubviews() {
    titleTableView.layoutSubviews()
  }
  
  // functions About filter data management
  private func makeEmptySelectedFilter() {
    if selectedFilterType.count == 0 {
      let ageArray = Array<Int>(repeating: 0, count: filterType[0].detail.count)
      let styleArray = Array<Int>(repeating: 0, count: filterType[1].detail.count)
      selectedFilterType.append(ageArray)
      selectedFilterType.append(styleArray)
    }
  }
}


// MARK: - IBAction
extension FilterViewController {
  @IBAction private func resetButton() {
    selectedFilterType.removeAll()
    self.titleTableView.reloadData()
  }
}


// MARK: - Filter Title TableView DataSource & Delegate
extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return filterType.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  // 셀이 테이블 뷰의 특정 위치에 삽입되도록 데이터 소스에 요청
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("\n---------- [ cellForRowAt ] -----------\n")
    let filterTypeCell = tableView.dequeueReusableCell(withIdentifier: "FilterTypeCell") as! FilterTypeCell
    return filterTypeCell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let totalItemCount = filterType[indexPath.section].detail.count
    let numberOfItemsInRow = self.numberOfItemsInRow[indexPath.section]
    
    var numberOfItesmInColumn = totalItemCount / numberOfItemsInRow
    if totalItemCount % numberOfItemsInRow != 0 {
      numberOfItesmInColumn += 1
    }
    
    let collectionViewTopInset: CGFloat = 15
    let tableCellHeight = (collectionViewTopInset * 2)
      + (self.collectionViewCellHeight * CGFloat(numberOfItesmInColumn))
      + (collectionViewLineSpace * CGFloat(numberOfItesmInColumn - 1))
    return tableCellHeight
  }
  
  // <실행 순서> CellForRowAt -> willDisplay (셀이 만들어지고 난 다음 -> 셀이 표시되기 직전에 호출)
  // 테이블뷰가 특정 행에 대해 셀을 그리려고한다는 것을 대리자에게 알림.
  func tableView(
    _ tableView: UITableView,
    willDisplay cell: UITableViewCell,
    forRowAt indexPath: IndexPath) {
    print("\n---------- [ willDisplay ] -----------\n")
    guard let tableViewCell = cell as? FilterTypeCell else { return }
    // delegate Setting - 왜 willDisplay에서 설정?
    // 왜냐하면, 이 단계 전까지는 셀이 유효한 프레임을 가지고 있지 않기 때문.
    tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
    // extension에서 컨트롤러가 collectionView DataSource & Delegate를 채택했기 때문에 self 가능
  }
  
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.titleTableView.frame.width, height: 30))
    headerView.backgroundColor = UIColor(hex: "e2e2e2")
    let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: 200, height: 30))
    headerLabel.text = filterType[section].title
    headerLabel.textColor = UIColor(hex: "505050")
    headerLabel.font = UIFont.systemFont(ofSize: 15)
    headerView.addSubview(headerLabel)
    return headerView
  }
}


// MARK: - Filter Detail CollectionView DataSource & Delegate
extension FilterViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filterType[collectionView.tag].detail.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let filterDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterDetailCell", for: indexPath) as! FilterDetailCell
    filterDetailCell.detailLabel.text = filterType[collectionView.tag].detail[indexPath.item]
    filterDetailCell.section = collectionView.tag
    if selectedFilterType.count == 0 {
      filterDetailCell.isClicked = false
      makeEmptySelectedFilter()
    } else {
      if selectedFilterType[collectionView.tag][indexPath.item] == 1 {
        filterDetailCell.isClicked = true
      } else {
        filterDetailCell.isClicked = false
      }
    }
    return filterDetailCell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let sideInset: CGFloat = 20 // 유연성 떨어지는 것.
    let section = collectionView.tag
    let width = self.view.frame.width -
      ((sideInset * 2) + (collectionViewLineSpace * (CGFloat(numberOfItemsInRow[section] - 1))))
    return CGSize(width: width / CGFloat(numberOfItemsInRow[section]), height: collectionViewCellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let filterDetailCell = collectionView.cellForItem(at: indexPath) as? FilterDetailCell else { return }
    if filterDetailCell.isClicked {
      filterDetailCell.isClicked = false
      selectedFilterType[collectionView.tag][indexPath.item] = 0 // 상태값에 대해서는 주석값을 넣기. 잘 모름. 아니면 Bool Type으로 설정
    } else {
      filterDetailCell.isClicked = true
      selectedFilterType[collectionView.tag][indexPath.item] = 1
    }
  }
}

