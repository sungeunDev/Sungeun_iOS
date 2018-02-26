//
//  ViewController.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 20..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!

    @objc func btnAction(_ sender: UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Navi") as! UINavigationController
        self.present(nextVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
    }
    
}

