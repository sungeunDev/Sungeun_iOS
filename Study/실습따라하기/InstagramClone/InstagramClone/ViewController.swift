//
//  ViewController.swift
//  InstagramClone
//
//  Created by sungnni on 2018. 9. 8..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction private func signUpBtn_TouchUpInside(_ sender: Any) {
        let fireBaseAuth = Auth.auth()
        fireBaseAuth.createUser(withEmail: "user3@gmail.com", password: "123456") { (user, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            let ref = Database.database().reference()
            
            let uid = user?.uid
            let usersRef = ref.child("users")
            let newUser = usersRef.child(uid!)
            newUser.setValue(["username":"user3@gmail.com", "email":"gamil"])
        }
    }

}

