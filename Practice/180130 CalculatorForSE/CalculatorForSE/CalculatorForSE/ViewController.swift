//
//  ViewController.swift
//  CalculatorForSE
//
//  Created by 박성은 on 2018. 1. 30..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayView: UIView!
    var keyPadView: UIView!
    var etcView: UIView!
    var operview: UIView!
    var numberPadView : UIView!
    
    var etcBtnList: [UIView] = []
    var operBtnList: [UIView] = []
    var numberPadBtnList: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        updateLayout()
        
    }
    
    // UI인스턴스 만드는 메소드
    private func createUI()
    {
        // display 영역
        displayView = UIView()
        self.view.addSubview(displayView)
        
        // keyPad 영역
        keyPadView = UIView()
        self.view.addSubview(keyPadView)
        
        // keyPad 내부 영역
        etcView = UIView()
        keyPadView.addSubview(etcView)
        operview = UIView()
        keyPadView.addSubview(operview)
        numberPadView = UIView()
        keyPadView.addSubview(numberPadView)
        
        // test를 위한 색상 지정
        displayView.backgroundColor = UIColor.darkGray
        keyPadView.backgroundColor = UIColor.black
        etcView.backgroundColor = .red
        operview.backgroundColor = .blue
        numberPadView.backgroundColor = .yellow
        
        // keyPad 내부 영역들 버튼 리스트 만들기
        etcBtnList = makeBtn(count: 3)
        operBtnList = makeBtn(count: 5)
        numberPadBtnList = makeBtn(count: 10)
        
        // 버튼 리스트 생성
        makeMatrix(for: etcBtnList, column: 3, superV: etcView)
        makeMatrix(for: operBtnList, column: 1, superV: operview)
        makeMatrix(for: numberPadBtnList, column: 3, superV: numberPadView)
    }
    
    // Btn List 생성 메소드
    func makeBtn(count: Int) -> [UIView]
    {
        var result: [UIView] = []
        
        for _ in 0..<count
        {
            result.append(UIView())
        }
        return result
    }
    
    // List 내부 Matrix 생성 메소드
    func makeMatrix(for list : [UIView], column: Int, superV: UIView)
    {
        let BtnSize: CGFloat = self.view.frame.size.width / 4
        
        for index in  0..<list.count
        {
            let col = index % column
            let row = index / column
            
            let pointX = superV.frame.origin.x
            let pointY = superV.frame.origin.y
            
            list[index].frame = CGRect(x: pointX + CGFloat(col) * BtnSize, y: pointY + CGFloat(row) * BtnSize, width: BtnSize, height: BtnSize)
            superV.addSubview(list[index])
        }
    }
    
    
    
    // UI인스턴스 프레임 설정 메소드
    private func updateLayout()
    {
        let margin: CGFloat = 100
        let BtnSize: CGFloat = self.view.frame.size.width / 4
        let offset: CGFloat = self.view.frame.size.height - BtnSize*5
        
        // self.view 영역 프레임 설정
        keyPadView.frame = CGRect(x: 0, y: offset, width: view.frame.size.width, height: BtnSize*5)
        displayView.frame = CGRect(x: 0, y: margin, width: view.frame.size.width, height: offset-margin)
        
        // KeyPadView 내부 영역 프레임 설정
        etcView.frame = CGRect(x: 0, y: 0, width: BtnSize*3, height: BtnSize)
        operview.frame = CGRect(x: BtnSize*3, y: 0, width: BtnSize, height: BtnSize*5)
        numberPadView.frame = CGRect(x: 0, y: BtnSize, width: BtnSize*3, height: BtnSize*4)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
}

