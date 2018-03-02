//
//  ViewController.swift
//  NotiPractice
//
//  Created by 박성은 on 2018. 2. 23..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var maintableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let noti = NotificationCenter.default
        noti.addObserver(forName: Notification.Name(rawValue: "notiKey"), object: nil, queue: nil) { (notification) in
            
            let tfText = notification.object as! String
            
            if var userInfo = UserDefaults.standard.array(forKey: "tfData")
            {
                userInfo.append(tfText)
                UserDefaults.standard.set(userInfo, forKey: "tfData")
            } else
            {
                let userInfo = [tfText]
                UserDefaults.standard.set(userInfo, forKey: "tfData")
            }
            
            self.maintableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let userInfo = UserDefaults.standard.array(forKey: "tfData")
        {
            return userInfo.count
        } else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        if var userInfo = UserDefaults.standard.array(forKey: "tfData")
        {
            let text = userInfo[indexPath.row] as? String
            cell.lb?.text = text
        } else
        {
            cell.lb = nil
        }
        return cell
    }

    @IBAction func trashAction(_ sender: Any) {
        if var userInfo = UserDefaults.standard.array(forKey: "tfData")
        {
            userInfo.removeAll()
            UserDefaults.standard.set(userInfo, forKey: "tfData")
            self.maintableView.reloadData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "notiKey"), object: nil)
    }
    
}

