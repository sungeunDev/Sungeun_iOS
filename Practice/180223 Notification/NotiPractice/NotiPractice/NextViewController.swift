//
//  NextViewController.swift
//  NotiPractice
//
//  Created by 박성은 on 2018. 2. 23..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var tf: UITextField!
    @IBAction func btnAction(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "notiKey"), object: tf.text)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
