//
//  SEViewController.swift
//  LifeCycleTest
//
//  Created by 박성은 on 2018. 2. 8..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class SEViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }

    @IBAction func backbtn(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)}
    
    
    @IBAction func action(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        print("viewDidAppear")
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        print("ViewWillAppear")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        print("ViewWillDisappear")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(true)
//        print("viewDidDisappear")
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        print("viewWillLayoutSubviews")
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        print("viewDidLayoutsubviews")
//    }
//
////    override func loadView() {
////        super.loadView()
////        print("loadView")
////    }
//    deinit {
//        print("deinit")
//    }
}
