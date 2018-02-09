//
//  NextVC.swift
//  NaviController
//
//  Created by 박성은 on 2018. 2. 9..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class NextVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBtn = UIBarButtonItem(title: "뒤뒤", style: .plain, target: self, action: #selector(self.back(_:)))
        self.navigationItem.leftBarButtonItem = leftBtn

        self.navigationItem.title = "NextVC"
        
        let rightBtn = UIBarButtonItem(title: "오오", style: .plain, target: self, action: #selector(self.back(_:)))
        let rightBtnArray: [UIBarButtonItem] = [rightBtn, rightBtn]
        self.navigationItem.rightBarButtonItems = rightBtnArray
        
        // viewDidAppear 에 넣으면 좀 자연스럽..?
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("will")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    @objc func back(_ sender: UIBarButtonItem)
    {
        self.navigationController?.popViewController(animated: true)
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
