//
//  ViewController.swift
//  180119
//
//  Created by 박성은 on 2018. 1. 19..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        func eratos(input: Int) -> [Int]
        {
            var eratosArray : [Int] = []
            for n in 0..<input
            {
                eratosArray[n] = n+1
            }
            
            var m = 0
            
            while m < eratosArray.count-1
            {
                if eratosArray[m]%2 == 0
                {
                    eratosArray.remove(at: m)
                    m = 0
                }else
                {
                    m += 1
                }
            }
            return eratosArray
        }
        
        print(eratos(input: 8))
    }
    
}

