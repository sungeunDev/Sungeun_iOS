//
//  ViewController.swift
//  CocoaPods
//
//  Created by sungnni on 2018. 3. 16..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
//import Then
import Alamofire

class ViewController: UIViewController {

//    let label = UILabel().then {
//        $0.text = "then"
//        $0.textColor = .black
//        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//    }

    lazy var imgView = UIImageView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imgView)
    
        let str = "https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg"
        let url = URL(string: str)!
        Alamofire.request(url)
            .responseData { (dataResponse) in
                if dataResponse.error == nil {
                    print(dataResponse.error)
                }
                if dataResponse.result.isSuccess {
                    DispatchQueue.main.async {
                        self.imgView.image = UIImage(data: dataResponse.data!)!
                    }
                } else {
                    print()
                }
        }
    
    }

}

