//
//  KakaoViewController.swift
//  kakaoTest
//
//  Created by sungnni on 2018. 3. 29..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Alamofire

class KakaoViewController: UIViewController {
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var thumbfileImg: UIImageView!
    
    var name: String?
    var age: String? {
        didSet {
            ageLabel.text = age
        }
    }
    
    var imgUrl: String? {
        didSet {
            Alamofire
                .request((imgUrl)!)
                .responseData { (response) in
                    if response.error == nil {
                        if let data = response.data {
                            self.profileImg.image = UIImage(data: data)
                        }
                    } else {
                        print(response.error!.localizedDescription)
                    }
            }
        }
    }
    
    var thumbUrl: String? {
        didSet {
            Alamofire
                .request((thumbUrl)!)
                .responseData { (response) in
                    if response.error == nil {
                        if let data = response.data {
                            self.thumbfileImg.image = UIImage(data: data)
                        }
                    } else {
                        print(response.error!.localizedDescription)
                    }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileName.text = name
        
//        self.navigationController?.navigationBar.topItem?.title = "print"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
}
