//
//  ViewController.swift
//  UI
//
//  Created by 박성은 on 2018. 1. 29..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let rect: CGRect = CGRect(x: 100, y: 100, width: 150, height: 100)
//        let viewTest: UIView = UIView(frame: rect)
        
        
        let subView: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 150, height: 100))
        subView.backgroundColor = UIColor.orange
        // orange는 type property. 때문에 class name으로 바로 부르는 것.
        
//        let color:UIColor = UIColor(red: 100/255, green:1, blue:1, alpha:1)
//        subView.backgroundColor = color
//        subView.backgroundColor = UIColor(red: 100/255, green:1, blue:1, alpha:1)
        // 원래라면 인스턴스 생성 후 대입해야 하는 것.
        
//        super view, root view name = view or self.view
        self.view.addSubview(subView)
        
        let halfView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.frame.size.height/2))
        halfView.backgroundColor = UIColor.gray
        view.insertSubview(halfView, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

