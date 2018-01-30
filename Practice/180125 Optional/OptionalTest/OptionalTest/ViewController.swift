//
//  ViewController.swift
//  OptionalTest
//
//  Created by 박성은 on 2018. 1. 25..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func isNumber(inputNum1:String, inputNum2:String) -> Bool
        {
            if let inputNum1 = Int(inputNum1), let inputNum2 = Int(inputNum2)
            {
                print("\(inputNum1), \(inputNum2)")
                return true
            }else {
                return false
            }
        }
        
        print(isNumber(inputNum1: "ㄱㄴㄷ", inputNum2: "3"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

