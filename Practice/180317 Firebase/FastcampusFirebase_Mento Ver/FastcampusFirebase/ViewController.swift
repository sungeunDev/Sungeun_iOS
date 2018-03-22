//
//  ViewController.swift
//  FastcampusFirebase
//
//  Created by Janginsu on 2017. 7. 10..
//  Copyright © 2017년 Janginsu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    //var rootRef: DatabaseReference!
    
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var valueTextField : UITextField!
    @IBOutlet weak var delItemTextField : UITextField!
    @IBOutlet weak var selItemTextField : UITextField!
    
    @IBOutlet weak var resultTextFiled : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //rootRef = Database.database().reference()
        ref = Database.database().reference()
       
        ref.child("JSON").observeSingleEvent(of: .value, with: { DataSnapshot in
            
            let value = DataSnapshot.value as? NSDictionary
            let name = value?["Name"] as? String ?? ""
            
            print("Name : " + name)
        })
        
//        ref.observeSingleEvent(of: .value, with: { snapshot in
//            let value = snapshot.value as? NSDictionary
//            let arr : NSMutableArray = value?.allKeys as! NSMutableArray
//
//            print(arr)
//
//        })
//
        
        ref.observe(.childAdded, with: { DataSnapshot in
            
                print("Item Added")
        })

        ref.observe(.childRemoved, with: { DataSnapshot in
            
            print("Item Removed")

        })
        
        
        ref.observe(.childChanged, with: { DataSnapshot in
            
            print("Item Changed")
            dump(DataSnapshot.value)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction
    func insertBtnAction(sender: UIButton) {
        
        let itemsRef = ref.child((nameTextField.text?.lowercased())!)
        itemsRef.setValue(valueTextField.text)
        
        nameTextField.text = ""
        valueTextField.text = ""
    }
    
    @IBAction
    func deleteBtnAction(sender: UIButton) {
        
        ref.child(delItemTextField.text!).removeValue(completionBlock: { (error , ref) in
            if error != nil {
                print("error \(String(describing: error))")
            }
            
            self.delItemTextField.text = ""
            
        })
    }
    
    @IBAction
    func selectBtnAction(sender : UIButton) {
        
//        ref.child(selItemTextField.text!).queryOrderedByKey().observe(.childAdded, with: { snapshot in
//            let rValue = snapshot.value as? String
//            self.resultLabel.text = rValue
//            
//            print("rVale \(String(describing: rValue))")
//        })
        
        
                ref.child(selItemTextField.text!).observeSingleEvent(of: .value, with: { DataSnapshot in
        
                    let value = DataSnapshot.value as? String
                    let name = value
        
                    print("Name : " + name!)
                    
                    self.resultTextFiled.text = value
                })
        
    }
    
}

