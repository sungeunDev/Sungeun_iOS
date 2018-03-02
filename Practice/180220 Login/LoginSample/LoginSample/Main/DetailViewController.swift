//
//  DetailViewController.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 28..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var userData: UserModel?
    
    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var profileImgView: UIImageView!
    
    @IBOutlet weak var profileLb: UILabel!
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var phoneNumLb: UILabel!
    @IBOutlet weak var emailLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userData = userData {
            // UI Data Update
            bgImgView.image = UIImage(named: userData.bgImgUrl)
            profileImgView.image = UIImage(named: userData.profileImgUrl)
            profileLb.text = userData.nickname
            descriptionLb.text = userData.profileDescription
            phoneNumLb.text = userData.phoneNumber
            emailLb.text = userData.email
        }
    }

    // viewDidLoad는 오토레이아웃이 적용되지 않은 상태
    // viewDidLayoutSubviews는 서브뷰 배치 후에 호출
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImgView.round()
        profileImgView.clipsToBounds = true
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
