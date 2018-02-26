//
//  ViewController.swift
//  NotiSample
//
//  Created by 박성은 on 2018. 2. 23..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let noti = NotificationCenter.default
        noti.addObserver(self, selector: #selector(notiAction(_:)), name: Notification.Name(rawValue: "notiKey"), object: nil)

    }

    @objc func notiAction(_ noti: Notification) {
        let text = noti.object as! String
        
        if var list = UserDefaults.standard.array(forKey: "save") {
            list.append(text)
            UserDefaults.standard.set(list, forKey: "save")
        } else
        {
            UserDefaults.standard.set([text], forKey: "save")
        }
        
        let list = UserDefaults.standard.array(forKey: "save")
        lb.text = list![(list?.count)!-1] as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "notiKey"), object: nil)
    }
    
}

