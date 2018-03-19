//
//  ViewController.swift
//  sample2
//
//  Created by sungnni on 2018. 3. 19..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet private weak var tf: UITextField!
    @IBOutlet private weak var resultTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        ref.observe(DataEventType.childAdded) { (data) in
            print("item add")
            self.resultTextField.text = dump(data.value) as? String
        }
        
        ref.observe(DataEventType.childChanged) { (data) in
            print("changed")
        }
        
        ref.observe(DataEventType.childRemoved) { (data) in
            print("removed")
        }
    }
    
    @IBAction func btnAction() {
        let single = ref.child("add").setValue(tf.text)
        let keyNvalue = ref.child(tf.text!).setValue(tf.text)
        
        let child = ref.child("parents").child("child").setValue(["array":tf.text])
    }
    

    

}

