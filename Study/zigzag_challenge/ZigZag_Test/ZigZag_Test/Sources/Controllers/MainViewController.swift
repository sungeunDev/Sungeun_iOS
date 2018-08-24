//
//  ViewController.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 2..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: IBOutlet
  @IBOutlet weak var weekLabel: UILabel!
  @IBOutlet weak var filterView: UIView!
  @IBOutlet weak var filterImage: UIImageView!
  
  @IBOutlet weak var shopListTableView: UITableView!
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var selectedFilterView: UIView!
  @IBOutlet weak var selectedFilterLabel: UILabel!
  
  // MARK: Properties
  var shopList: ShopList? {
    willSet {
      weekLabel.text = "\(newValue!.week)차 랭킹"
    }
  }
  
  var selectedFilterType: [[Int]]? {
    willSet {
      if newValue?.count != nil {
        fetchData()
        self.selectedAge = newValue![0].convertToStringArray(of: FilterType.fullAgeArray)
        self.selectedStyle = newValue![1].convertToStringArray(of: FilterType.fullStyleArray)
        self.shopList?.list = self.filterAge(of: newValue![0])
        self.shopList?.list = self.filterStyle(of: selectedStyle!)
      }
      shopListTableView.reloadData()
    }
  }
  
  var isSelectedFilter: Bool = false {
    willSet {
      updateFilterButtonUI(of: newValue)
      if newValue {
        filterView.backgroundColor = UIColor(hex: "e8e8e8")
        filterImage.tintColor = UIColor(hex: "ffca00")
      } else {
        filterView.backgroundColor = UIColor.white
        filterImage.tintColor = UIColor(hex: "999999")
      }
    }
  }
  
  var selectedAge: [String]?
  var selectedStyle: [String]?
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    shopListTableView.register(UINib(nibName: "ShopCell", bundle: nil), forCellReuseIdentifier: "ShopCell")
    fetchData()
    updateFilterView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.selectedFilterView.isHidden = !isSelectedFilter
    adjustTableViewHeaderHeight()
  }
  
  // MARK: - Segue
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let filterVC = segue.destination as? FilterViewController else { return }
    if let selectedFilterType = selectedFilterType {
      filterVC.selectedFilterType = selectedFilterType
    } else {
      filterVC.selectedFilterType = []
    }
  }
  
  // MARK: - IBAction
  @IBAction private func didUnwindFromFilterVC(_ sender: UIStoryboardSegue) {
    guard let filterVC = sender.source as? FilterViewController else { return }
    if sender.identifier == "selectComplete" {
      let selectedFilterCount = filterVC.selectedFilterType.reduce(0, { (result, filterArray) -> Int in
        return result + filterArray.convertToInt()
      })
      if selectedFilterCount != 0 {
        self.selectedFilterType = filterVC.selectedFilterType
        self.isSelectedFilter = true
      } else {
        self.selectedFilterType = nil
        self.isSelectedFilter = false
        fetchData()
      }
    }
  }
  
  @IBAction private func topButtonAction() {
    if self.shopListTableView.contentOffset.y <= 25000 {
      self.shopListTableView.scrollRectToVisible(CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1), animated: true)
    } else {
      self.shopListTableView.scrollRectToVisible(CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1), animated: false)
    }
  }
}



// MARK: - Update UI
extension MainViewController {
  private func adjustTableViewHeaderHeight() {
    guard let headerView = shopListTableView.tableHeaderView else { return }
    if isSelectedFilter {
      headerView.frame.size.height = 70
    } else {
      headerView.frame.size.height = 40
    }
    shopListTableView.tableHeaderView = headerView
    shopListTableView.layoutIfNeeded()
  }
  
  private func updateFilterView() {
    filterView.setRoundedBorder(width: 0.5, radius: 4)
    filterImage.image = UIImage(named: "filterIcon.png")?.withRenderingMode(.alwaysTemplate)
    filterImage.tintColor = UIColor(hex: "999999")
  }
  
  private func updateFilterButtonUI(of isSelectedFilter: Bool) {
    if isSelectedFilter {
      filterView.backgroundColor = UIColor(hex: "e8e8e8")
      filterImage.tintColor = UIColor(hex: "ffca00")
      updateSelectedFilterLabelUI()
    } else {
      filterView.backgroundColor = UIColor.white
      filterImage.tintColor = UIColor(hex: "999999")
    }
  }
  
  private func updateSelectedFilterLabelUI() {
    if let selectedAge = self.selectedAge,
      let selectedStyle = self.selectedStyle {
      let age = String(selectedAge.reduce("") { $0 + $1 + ", " }).dropLast(2)
      let style = String(selectedStyle.reduce("") { $0 + $1 + ", " }).dropLast(2)
      
      if age.count != 0 && style.count != 0 {
        selectedFilterLabel.text = "\(age) / \(style)"
      } else if age.count == 0 && style.count != 0 {
        selectedFilterLabel.text = "\(style)"
      } else if age.count != 0 && style.count == 0 {
        selectedFilterLabel.text = "\(age)"
      }
    }
  }
  
  private func updateTopButtonUI() {
    let btnSize: CGFloat = 15
    let topButton = UIButton(frame: CGRect(x: 300, y: 300, width: btnSize, height: btnSize))
    topButton.imageView?.image = UIImage(named: "topButton.jpeg")?.withRenderingMode(.alwaysTemplate)
    topButton.tintColor = UIColor.mainColor
    self.view.addSubview(topButton)
  }
}


// MARK: - About Data
extension MainViewController {
  private func fetchData() {
    DataService.image { (result) in
      switch result {
      case .success(let shopList):
        self.shopList = shopList
        self.shopListTableView.reloadData()
      case .failure(let error):
        print(error)
      }
    }
  }
  
  // MARK: - filter Logic
  private func filterStyle(of list: [String]) -> [Shop] {
    var filteredShopList = self.shopList!.list
    if list.count != 0 {
      filteredShopList = filteredShopList.filter { (shop) -> Bool in
        for i in list {
          if shop.style.contains(i) {
            return true
          }
        }
        return false
        }.sorted { (first, second) -> Bool in
          if list.countToEqual(to: first.style) == list.countToEqual(to: second.style) {
            return first.score >= second.score
          } else {
            return list.countToEqual(to: first.style) > list.countToEqual(to: second.style)
          }
      }
    }
    return filteredShopList
  }
  
  private func filterAge(of list: [Int]) -> [Shop] {
    var filteredShopList = self.shopList!.list
    let comparedNum = list.convertToInt()
    if comparedNum != 0 {
      filteredShopList = filteredShopList.filter { (comparedNum & $0.age.convertToInt() != 0) }
        .sorted {
          let firstMatchingCount = (comparedNum & $0.age.convertToInt()).nonzeroBitCount
          let secondMatchingCount = (comparedNum & $1.age.convertToInt()).nonzeroBitCount
          if firstMatchingCount == secondMatchingCount {
            return $0.score > $1.score
          } else {
            return firstMatchingCount > secondMatchingCount
          }
      }
    }
    return filteredShopList
  }
}


// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shopList?.list.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let shopCell = tableView.dequeueReusableCell(withIdentifier: "ShopCell", for: indexPath) as! ShopCell
    shopCell.index = indexPath.row + 1
    shopCell.source = shopList?.list[indexPath.row]
    shopCell.rankingView.isHidden = isSelectedFilter
    if isSelectedFilter {
      shopCell.selectedFilterStyle = selectedStyle
    }
    return shopCell
  }
}


// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 65
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
