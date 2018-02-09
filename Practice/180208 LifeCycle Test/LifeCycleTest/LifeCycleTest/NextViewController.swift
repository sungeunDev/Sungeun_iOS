//
//  NextViewController.swift
//  LifeCycleTest
//
//  Created by 박성은 on 2018. 2. 8..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }

    @IBAction func btn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
