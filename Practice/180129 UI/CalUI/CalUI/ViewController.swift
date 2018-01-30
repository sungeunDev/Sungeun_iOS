//
//  ViewController.swift
//  CalUI
//
//  Created by 박성은 on 2018. 1. 29..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberMatrix = makeList(of: 9)
        let numberView: UIView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height*3/7, width: self.view.frame.size.width*3/4, height: self.view.frame.size.height*3/7))
        self.view.addSubview(numberView)
        addMatrix(input: numberMatrix, superView: numberView, col: 3, row: 3)
        
        
        let operMatrix = makeList(of: 4)
        let operView: UIView = UIView(frame: CGRect(x: self.view.frame.size.width*3/4, y: self.view.frame.size.height*3/7, width: self.view.frame.size.width*1/4, height: self.view.frame.size.height*4/7))
        self.view.addSubview(operView)
        addMatrix(input: operMatrix, superView: operView, col: 1, row: 4)
        
    }
    
    
    func makeList(of num: Int) -> [UIButton]
    {
        var list: [UIButton] = []
        
        for num in 0..<num
        {
            let uiView = UIButton()
//            uiView.backgroundColor = getColor(input: num%4)
            uiView.tag = num
            
            uiView.titleLabel?.font = UIFont(name: "...", size: 40)
            uiView.setTitle(String(num+1), for: .normal)
            uiView.backgroundColor = getColor(input: num)
            
            list.append(uiView)
        }
        return list
    }
    
    let marginX:CGFloat = 5
    let marginY:CGFloat = 5
    
    func addMatrix(input: [UIButton], superView: UIView, col: Int, row:Int)
    {
        let widthSize = CGFloat(superView.frame.size.width-2*marginX)/CGFloat(col)
        let heightSize = CGFloat(superView.frame.size.height-2*marginY)/CGFloat(row)
        
        for num in 0..<input.count
        {
            let colTemp = CGFloat(num%col)
            let rowTemp = CGFloat(num/col)
            
            input[num].frame = CGRect(x: marginX + widthSize * colTemp, y: marginY + heightSize * rowTemp, width: widthSize, height: heightSize)
            superView.addSubview(input[num])
        }
    }
    
    func getColor(input: Int) -> UIColor
    {
        let inputCGF: CGFloat = CGFloat(input*20 + 10)
        return UIColor(red: 1, green: inputCGF/255, blue: inputCGF/255, alpha: 0.5)
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

