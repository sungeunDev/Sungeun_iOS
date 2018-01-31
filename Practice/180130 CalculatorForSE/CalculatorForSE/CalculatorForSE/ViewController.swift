//
//  ViewController.swift
//  CalculatorForSE
//
//  Created by 박성은 on 2018. 1. 30..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayView: UILabel!
    var keyPadView: UIView!
    var etcView: UIView!
    var operView: UIView!
    var numberPadView : UIView!
    
    var etcBtnList: [UIButton] = []
    var operBtnList: [UIButton] = []
    var numberPadBtnList: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        updateLayout()
    }
    
    // UI인스턴스 만드는 메소드
    private func createUI()
    {
        // display 영역
        displayView = UILabel()
        // display 텍스트 설정
        displayView.text = "0"
        displayView.textAlignment = NSTextAlignment.right
        displayView.textColor = .white
        displayView.font = UIFont.systemFont(ofSize: 80)
        // display layer 모양 설정
        displayView.layer.cornerRadius = 20
        displayView.layer.borderWidth = 1
        displayView.layer.borderColor = UIColor.white.cgColor
        displayView.clipsToBounds = true
        // display View 추가
        self.view.addSubview(displayView)
        //=============================================
        // keyPad 영역
        keyPadView = UIView()
        self.view.addSubview(keyPadView)
        
        // keyPad 내부 영역
        etcView = UIView()
        keyPadView.addSubview(etcView)
        operView = UIView()
        keyPadView.addSubview(operView)
        numberPadView = UIView()
        keyPadView.addSubview(numberPadView)
        
        // test를 위한 색상 지정
        displayView.backgroundColor = UIColor.darkGray
        keyPadView.backgroundColor = UIColor.gray
        operView.backgroundColor = .orange
        
        // keyPad 내부 영역들 버튼 리스트 만들기
        etcBtnList = makeBtn(count: 3)
        arrange(viewList: etcBtnList, columnCount: 3, width: self.view.frame.size.width / 4)
        
        let etcTitleList = ["C", "±", "%"]
        for index in 0..<etcBtnList.count
        {
            let title = etcTitleList[index]
            let btn = etcBtnList[index]
            
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.white.cgColor
            
            btn.setTitle(title, for: .normal)
            btn.addTarget(self, action: #selector(self.etcHandler(_:)), for: .touchUpInside)
            etcView.addSubview(btn)
        }
        
        operBtnList = makeBtn(count: 5)
        arrange(viewList: operBtnList, columnCount: 1, width: self.view.frame.size.width / 4)
        let operTitleList = ["+", "−", "×", "÷", "="]
        for index in 0..<operBtnList.count
        {
            let title = operTitleList[index]
            let btn = operBtnList[index]
            
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.white.cgColor
            
            btn.setTitle(title, for: .normal)
            btn.addTarget(self, action: #selector(self.operHandler(_:)), for: .touchUpInside)
            operView.addSubview(btn)
        }
        
        numberPadBtnList = makeBtn(count: 10)
        arrange(viewList: numberPadBtnList, columnCount: 3, width: self.view.frame.size.width / 4)
        let numberPadTitleList = ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0"]
        for index in 0..<numberPadBtnList.count
        {
            let title = numberPadTitleList[index]
            let btn = numberPadBtnList[index]
            
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.white.cgColor
            
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.orange, for: .highlighted)
            btn.addTarget(self, action: #selector(self.numberPadHandler(_:)), for: .touchUpInside)
            btn.addTarget(self, action: #selector(self.numberDown(_:)), for: .touchDown)
            numberPadView.addSubview(btn)
        }
    }
    
    // Btn List 생성 메소드
    func makeBtn(count: Int) -> [UIButton]
    {
        var returnList: [UIButton] = []
        
        for num in 0..<count
        {
            let btn = UIButton()
            btn.tag = num
            returnList.append(btn)
        }
        return returnList
    }
    
    // 생성한 버튼 위치 설정
    func arrange(viewList: [UIButton], columnCount: Int, width: CGFloat)
    {
        for index in  0..<viewList.count
        {
            let col = CGFloat(index % columnCount)
            let row = CGFloat(index / columnCount)
            
            viewList[index].frame = CGRect(x: col * width, y: row * width, width: width, height: width)
        }
    }
    
    // UI인스턴스 프레임 설정 메소드
    private func updateLayout()
    {
        // 화면 위에서부터 여백 설정
        let topMargin: CGFloat = 30
        // 버튼은 화면의 가로에 4개씩 배치
        let btnSize: CGFloat = self.view.frame.size.width / 4
        // 화면 아래에서부터 배치
        let offset: CGFloat = self.view.frame.size.height - btnSize*5
        //====================================================================
        // 키패드 영역 프레임 설정
        keyPadView.frame = CGRect(x: 0, y: offset, width: view.frame.size.width, height: btnSize*5)
        // 디스플레이 영역 프레임 설정
        let displayHeight = offset - topMargin
        displayView.frame = CGRect(x: 0, y: topMargin, width: view.frame.size.width, height: displayHeight)
        //====================================================================
        // <KeyPadView 내부 영역 프레임 설정>
        
        // etc 영역 프레임 설정
        etcView.frame = CGRect(x: 0, y: 0, width: btnSize*3, height: btnSize)
        // 연산자 영역 프레임 설정
        operView.frame = CGRect(x: btnSize*3, y: 0, width: btnSize, height: btnSize*5)
        // 숫자패드 영역 프레임 설정
        numberPadView.frame = CGRect(x: 0, y: btnSize, width: btnSize*3, height: btnSize*4)
    }
    
    @objc func etcHandler(_ sender: UIButton)
    {
        print(sender.tag)
        print(sender.titleLabel?.text)
    }
    
    @objc func operHandler(_ sender: UIButton)
    {
        print(sender.tag)
        print(sender.titleLabel?.text)
    }
    
    @objc func numberPadHandler(_ sender: UIButton)
    {
        sender.backgroundColor = .clear
        print(sender.tag)
        print(sender.titleLabel?.text)
    }
    
    @objc func numberDown(_ sender: UIButton)
    {
        sender.backgroundColor = .white
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
}

