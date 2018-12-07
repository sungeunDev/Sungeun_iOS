//
//  ViewController.swift
//  HowlFirebaseGoogleLogin
//
//  Created by Ari on 06/12/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        Auth.auth().addStateDidChangeListener { (user, err) in
            if user != nil {
                self.performSegue(withIdentifier: "next", sender: self)
            }
        }
    }
    
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signIn() {
        GIDSignIn.sharedInstance()?.signIn()
    }

    @IBAction func signInAction(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            
            if error != nil {
                print("----------------< error: \(error?.localizedDescription) >----------------")
                return
            }
            let alert = UIAlertController(title: "알림", message: "회원가입 완료", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginBtnAction() {
        
        let firebaseAuth = Auth.auth()
        
        if let user = firebaseAuth.currentUser {
            print(firebaseAuth.currentUser?.email)
            do {
                try firebaseAuth.signOut()
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "알림", message: "로그아웃 완료", preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    
                    self.loginBtn.setTitle("로그인", for: .normal)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            
            Auth.auth().signIn(withEmail: email.text!,
                               password: password.text!) { (user, error) in
                                if error != nil {
                                    print("----------------< error: \(error?.localizedDescription) >----------------")
                                    return
                                }
                                
                                DispatchQueue.main.async {
                                    let alert = UIAlertController(title: "알림", message: "로그인 완료", preferredStyle: .alert)
                                    let action = UIAlertAction(title: "확인", style: .default, handler: nil)
                                    alert.addAction(action)
                                    self.present(alert, animated: true, completion: nil)
                                    
                                    print(firebaseAuth.currentUser?.email)
                                    self.loginBtn.setTitle("로그아웃", for: .normal)
                                }
            }
            
        }
    }
}

