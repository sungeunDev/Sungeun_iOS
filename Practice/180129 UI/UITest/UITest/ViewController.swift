//
//  ViewController.swift
//  UITest
//
//  Created by 박성은 on 2018. 1. 29..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let first:UIView = UIView(frame: CGRect(x: 15, y: 15, width: view.frame.size.width-30, height: view.frame.size.height-30))
//
//        let second:UIView = UIView(frame: CGRect(x: 15, y: 15, width: first.frame.size.width-30, height: first.frame.size.height-30))
//
//        let third:UIView = UIView(frame: CGRect(x: 15, y: 15, width: second.frame.size.width-30, height: second.frame.size.height-30))
//
//        first.backgroundColor = UIColor.blue
//        second.backgroundColor = UIColor.red
//        third.backgroundColor = UIColor.green
//
//        self.view.addSubview(first)
//        first.addSubview(second)
//        second.addSubview(third)
        
        let makeView = makeViewList(num: 10)
//        makeFrame(of: makeView)
        addView(of: makeView)
        
    }
    
    func makeViewList(num: Int) -> [UIView]
    {
        var viewList: [UIView] = []
        for n in 0..<num
        {
            let uiView = UIView()
            uiView.backgroundColor = getColor(input: n)
            uiView.tag = n
            viewList.append(uiView)
        }
        return viewList
    }
    
    func getColor(input: Int) -> UIColor
    {
        let inputCGF: CGFloat = CGFloat(input + 30)
        return UIColor(red: 1, green: inputCGF/255, blue: inputCGF/255, alpha: inputCGF/255)
        
//        switch input {
//        case 0:
//            return UIColor.blue
//        case 1:
//            return UIColor.yellow
//        case 2:
//            return UIColor.green
//        case 3:
//            return UIColor.red
//        default:
//            return UIColor.white
//        }
    }
    
    let margin: CGFloat = 15
   
//    func makeFrame(of list: [UIView])
//    {
//        for num in 0..<list.count
//        {
//            if num == 0
//            {
//                list[num].frame = CGRect(x: margin, y: margin, width: self.view.frame.size.width-margin*2, height: self.view.frame.size.height-margin*2)
//            } else
//            {
//                list[num].frame = CGRect(x: margin, y: margin, width: list[num-1].frame.size.width-margin*2, height: list[num-1].frame.size.height-margin*2)
//
//            }
//        }
//    }
    
    func makeMatric(for list:[UIView], column: Int)
    {
        for index in 0..<list.count
        {
            let col = index % column
            let row = index / column
            
            list[index].frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        }
    }
    
    
    
    func addView(of list: [UIView])
    {
        for num in 0..<list.count
        {
            if num == 0
            {
                self.view.addSubview(list[num])
            } else
            {
                list[num-1].addSubview(list[num])
            }
        }
    }

//    viewList -> Frame -> Add
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

