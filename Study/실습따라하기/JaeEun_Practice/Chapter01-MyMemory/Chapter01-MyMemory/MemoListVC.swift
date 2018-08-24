//
//  MemoListVC.swift
//  Chapter01-MyMemory
//
//  Created by sungnni on 2018. 8. 24..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
  
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.tableView.reloadData()
  }
  
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.appDelegate.memoList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = self.appDelegate.memoList[indexPath.row]
    
    let cellId = row.image == nil ? "memoCell" :  "memoCellWithImage"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
    
    cell.subject.text = row.title
    cell.contents.text = row.contents
    cell.img?.image = row.image
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    cell.regDate.text = formatter.string(from: row.regDate!)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = self.appDelegate.memoList[indexPath.row]
    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else { return }
    vc.param = row
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
