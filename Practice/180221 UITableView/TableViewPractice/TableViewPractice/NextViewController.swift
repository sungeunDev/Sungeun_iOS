//
//  NextViewController.swift
//  TableViewPractice
//
//  Created by 박성은 on 2018. 2. 21..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    let friend = ["성은이2", "성으니2", "박성은2", "SE2", "썽니", "박썽", "썽", "성은", "朴性垠", "뀨기", "판박이"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friend.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = friend[indexPath.row]
            return cell
        } else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath)
            cell.textLabel?.text = friend[indexPath.row]
            cell.detailTextLabel?.text = "멍멍"
            return cell
        }
    }
}
