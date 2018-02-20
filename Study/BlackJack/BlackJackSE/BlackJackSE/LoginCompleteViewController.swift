//
//  LoginCompleteViewController.swift
//  BlackJackSE
//
//  Created by 박성은 on 2018. 2. 19..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class LoginCompleteViewController: UIViewController {

    @IBOutlet weak var welcomLb: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(leftBarButtonAction(_:)))
        
        if let id = UserDefaults.standard.string(forKey: "userID")
        {
            welcomLb.text =
            """
            환영합니다. \(id)님
            로그인 되었습니다.
            """
        }
    }

    @objc private func leftBarButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func gameStartAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVc: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @IBOutlet weak var coinBtnAction: UIButton!
}
