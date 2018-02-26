//
//  ViewController.swift
//  UITableViewSample
//
//  Created by 박성은 on 2018. 2. 21..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let array = ["a", "b", "c", "d", "e"]
    let arrayDetail = ["aa", "bb", "cc", "dd", "ee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView: UITableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // >> Custom 시 UITableViewCell.self -> CustomViewCell.self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "myCell")
        
        view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            // >> Custom 시 as! CustomViewCell
            let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
            cell.setSelected(true, animated: true)
            cell.backgroundColor = .gray
            
            cell.textLabel?.text = array[indexPath.row]
            cell.imageView?.image = #imageLiteral(resourceName: "images.jpg")
            cell.accessoryType = .checkmark
            cell.detailTextLabel?.text = arrayDetail[indexPath.row]
            return cell
        } else
        {
//            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell.textLabel?.text = "\(indexPath.row)"
            cell.detailTextLabel?.text = "hmm"
            cell.backgroundColor = .yellow
            cell.accessoryType = .detailButton
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //        print("numberOfSections")
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 100
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section % 2 == 0 {
            return "짝수"
        } else
        {
            return "홀수"
        }
    }
    
    // 클릭하면 호출. 클릭한 셀의 indexPath를 가져올 수 있음.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 셀을 가져올 수 있음.
        let cell = tableView.cellForRow(at: indexPath)
        let title = cell?.textLabel?.text
        cell?.textLabel?.text = "선택"
        
        let title2 = array[indexPath.row]
        
        let nextVC = UIViewController()
        nextVC.view.backgroundColor = .blue
        present(nextVC, animated: true, completion: nil)
        nextVC.title = title
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.backgroundColor = .clear
    }
}

