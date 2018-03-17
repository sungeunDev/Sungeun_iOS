//
//  ViewController.swift
//  FirebaseSample
//
//  Created by sungnni on 2018. 3. 17..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController{
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var valueTf: UITextField!
    @IBOutlet weak var deleteItemTf: UITextField!
    @IBOutlet weak var selItemTextField : UITextField!
    @IBOutlet weak var resultTextFiled : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // 1번 불리는 이벤트
        //        ref.child("").observeSingleEvent(of: .value) { (DataSnapshot) in
        //            let value = DataSnapshot.value as? NSDictionary
        //            let name = value?["name"] as? String ?? ""
        //            print("Name: " + name)
        //        }
        
        
        ref.observe(.childAdded) { (data) in
            self.resultTextFiled.text = dump(data.value) as? String
            print("item add")
        }
        
        ref.observe(.childRemoved) { (_) in
            print("item remove")
        }
        
        ref.observe(.childChanged) { (_) in
            print("item change")
        }
    }
    
    
    @IBAction
    func importBtnAction(sender: UIButton) {
        
        // 어디에 add할건지 정함.
        let itemsRef = ref.child((nameTf.text?.lowercased())!)
        itemsRef.setValue(valueTf.text)
        
        //        let test = ref.child("users")
        //                   .child(nameTf.text!)
        //                   .setValue(["username": valueTf.text])
        
                nameTf.text = ""
                valueTf.text = ""
        valueTf.resignFirstResponder()
    }
    
    @IBAction
    func deleteBtnAction(sender: UIButton) {
        
    }
    
    @IBAction
    func selectBtnAction(sender: UIButton) {
    }
}

