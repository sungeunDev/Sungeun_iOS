//
//  ViewController.swift
//  UITestSample
//
//  Created by Ari on 2018. 10. 18..
//  Copyright © 2018년 ssungnni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func clickedBtn(_ sender: Any) {
        textField2.text = textField1.text
    }
    
    @IBAction func reset() {
        textField1.text = ""
        textField2.text = ""
    }
    
}

