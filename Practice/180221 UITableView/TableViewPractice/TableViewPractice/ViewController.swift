//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 박성은 on 2018. 2. 21..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let friend = ["성은이", "성으니", "박성은", "SE", "썽니", "박썽", "썽", "성은", "朴性垠", "뀨기", "판박이"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView()
        self.navigationItem.title = "내 이름"
    }

    private func tableView() {
        
        let tableView: UITableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friend.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let list = friend.sorted()
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let title = cell?.textLabel?.text
        
//        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
//        nextVC.titleText = title
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        <#code#>
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
}

