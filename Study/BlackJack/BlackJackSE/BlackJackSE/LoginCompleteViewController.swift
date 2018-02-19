//
//  LoginCompleteViewController.swift
//  BlackJackSE
//
//  Created by 박성은 on 2018. 2. 19..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class LoginCompleteViewController: LoginViewController {

    @IBOutlet weak var welcomLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomLb.text =
        """
        환영합니다. \(idReal)님
        로그인 되었습니다.
        """
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
