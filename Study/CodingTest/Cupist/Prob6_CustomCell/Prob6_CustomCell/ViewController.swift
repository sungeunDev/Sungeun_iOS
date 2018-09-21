//
//  ViewController.swift
//  Prob6_CustomCell
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let data = ["낙천적인, 애교있는",
                "낙천적인, 애교있는, 감성적인, 사랑스러운, 유머러스한",
                "낙천적인, 애교있는, 감성적인, 사랑스러운, 유머러스한, 낙천적인, 애교있는, 감성적인, 사랑스러운, 유머러스한"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.characters = data[indexPath.row]
        return cell
    }
}

