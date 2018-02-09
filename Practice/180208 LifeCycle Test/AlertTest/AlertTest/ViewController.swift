//
//  ViewController.swift
//  AlertTest
//
//  Created by 박성은 on 2018. 2. 8..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func action(_ sender: Any) {
    
        let alertVC = UIAlertController(title: "타이틀", message: "메세지", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "yes", style: .default) { (action) in
            //
        }
        let action2 = UIAlertAction(title: "no", style: .cancel) { (action) in
            //
        }
        
        alertVC.addAction(action1)
        alertVC.addAction(action2)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

