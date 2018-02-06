//
//  ViewController.swift
//  SelectedState
//
//  Created by 박성은 on 2018. 2. 2..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var left: UIButton!
    var middle: UIButton!
    var right: UIButton!
    var selectedState: UIButton?
    
    var btnList: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSelectOne()
        updateLayer()
        
        btnList = makeList(count: 5)
        createSelectMulti(btnList: btnList)
    
    }
    
    func createSelectOne()
    {
        left = UIButton(type: .custom)
        middle = UIButton()
        right = UIButton()
        
//        left.backgroundColor = .blue
//        middle.backgroundColor = .red
//        right.backgroundColor = .yellow
        
        left.setTitle("왼쪽", for: .normal)
        left.setTitleColor(.blue, for: .normal)
        left.setTitleColor(.red, for: .selected)
        
        middle.setTitle("가운데", for: .normal)
        middle.setTitleColor(.blue, for: .normal)
        middle.setTitleColor(.red, for: .selected)
        
        right.setTitle("오른쪽", for: .normal)
        right.setTitleColor(.blue, for: .normal)
        right.setTitleColor(.red, for: .selected)
        
        //        left.isSelected = true
        //        middle.isSelected = true
        //        right.isSelected = true
        
        left.addTarget(self, action: #selector(selected(_:)), for: .touchUpInside)
        middle.addTarget(self, action: #selector(selected(_:)), for: .touchUpInside)
        right.addTarget(self, action: #selector(selected(_:)), for: .touchUpInside)
        
        view.addSubview(left)
        view.addSubview(middle)
        view.addSubview(right)
    }
    
    func updateLayer()
    {
        left.frame = CGRect(x: 30, y: 30, width: 50, height: 30)
        middle.frame = CGRect(x: 30, y: 70, width: 50, height: 30)
        right.frame = CGRect(x: 30, y: 110, width: 50, height: 30)
    }
    
    @objc func selected(_ sender: UIButton)
    {
        if sender.isSelected == false
        {
            if let selectedState = selectedState
            {
                selectedState.isSelected = false
            }
            sender.isSelected = true
            selectedState = sender
           
        } else
        {
            sender.isSelected = false
            selectedState = nil
        }
    }
    
    
    
    func createSelectMulti(btnList: [UIButton])
    {
       for index in 0..<btnList.count
       {
             view.addSubview(btnList[index])
        }
    }
    
    func makeList(count: Int) -> [UIButton]
    {
        var returnList = [UIButton]()
        let btn = UIButton()
        
        for index in 0..<count
        {
            btn.tag = index
            btn.setTitleColor(.blue, for: .normal)
            btn.setTitleColor(.red, for: .selected)
            btn.setTitle(String(btn.tag), for: .normal)
            returnList.append(btn)
        }
        
        return returnList
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

