//
//  ViewController.swift
//  CalculatorRepeat
//
//  Created by 박성은 on 2018. 1. 30..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 디스플레이 뷰
    var displayView: UILabel!
    // keypad뷰(숫자, 연산자, 기타)
    var keypadView: UIView!
    // keypad 내부 영역
    var numberPadView: UIView!
    var etcView: UIView!
    var operView: UIView!
    
    var numberPadList: [UIButton] = []
    var etcList: [UIButton] = []
    var operList: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        updateLayer()
    }
    
    // 인스턴스 생성, 뷰 추가
    func createView()
    {
        // self.view 배경색 설정
        self.view.backgroundColor = UIColor.init(rgb: 0x5776e0)
        // ================================================
        // <<view 영역>>
        // <display>
        displayView = UILabel()
        displayView.text = "0"
        displayView.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        displayView.textColor = .white
        displayView.textAlignment = NSTextAlignment.right
        self.view.addSubview(displayView)
        // <keyPad>
        keypadView = UIView()
        keypadView.backgroundColor = UIColor.init(rgb: 0xf6f8ff)
        self.view.addSubview(keypadView)
        // ================================================
        // <<키패드 내부 영역>>
        // <etc>
        // View 추가
        etcView = UIView()
        etcView.backgroundColor = UIColor.init(rgb: 0xe7ecfd)
        keypadView.addSubview(etcView)
        // Btn List 생성
        etcList = makeBtn(count: 3)
        arrangeBtn(btnList: etcList, column: 3)
        // Btn 설정
        let etcTitleList = ["C", "±", "%"]
        for index in 0..<etcList.count
        {
            let title = etcTitleList[index]
            let btn = etcList[index]
            // ui setting
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(UIColor.init(rgb: 0x5776e0), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: .bold)
            // add Target
            btn.addTarget(self, action: #selector(self.etcHandler(_:)), for: .touchUpInside)
            btn.addTarget(self, action: #selector(self.touchDownChangeColor(_:)), for: .touchDown)
            // btn 추가
            etcView.addSubview(btn)
        }
        // ---------------------------------------------------------
        // <숫자 패드>
        // View 추가
        numberPadView = UIView()
        keypadView.addSubview(numberPadView)
        // Btn List 생성
        numberPadList = makeBtn(count: 12)
        arrangeBtn(btnList: numberPadList, column: 3)
        // Btn 설정
        let numberPadTitleList = ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0", ".", "⇤"]
        for index in 0..<numberPadList.count
        {
            let btn = numberPadList[index]
            let title = numberPadTitleList[index]
            // ui setting
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            // add Target
            btn.addTarget(self, action: #selector(self.numberPadHandler), for: .touchUpInside)
            btn.addTarget(self, action: #selector(self.touchDownChangeColor(_:)), for: .touchDown)
            // btn 추가
            numberPadView.addSubview(btn)
        }
        // ---------------------------------------------------------
        // <연산자>
        // operView에 oper 버튼 생성 / 정렬 / 추가
        operView = UIButton()
        operView.backgroundColor = UIColor.init(rgb: 0xe7ecfd)
        keypadView.addSubview(operView)
        // oper ui 꾸미기
        operList = makeBtn(count: 5)
        arrangeBtn(btnList: operList, column: 1)
        let operTitleList = ["÷", "×", "−", "+", "="]
        for index in 0..<operList.count
        {
            let btn = operList[index]
            let title = operTitleList[index]
             // ui setting
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(UIColor.init(rgb: 0x5776e0), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: .bold)
            // add Target
            btn.addTarget(self, action: #selector(self.operHandler(_:)), for: .touchUpInside)
            btn.addTarget(self, action: #selector(self.touchDownChangeColor(_:)), for: .touchDown)
            // btn 추가
            operView.addSubview(btn)
        }
    }
    
    // 프레임 설정
    func updateLayer()
    {
        // (0, 0)부터 여백 설정
        let marginX: CGFloat = 10
        let marginY: CGFloat = 50
        // 버튼 크기는 화면 가로 폭의 1/4
        let btnSize: CGFloat = self.view.frame.size.width / 4
        // 화면 아래서부터 사이즈 계산
        let offset: CGFloat = self.view.frame.size.height - btnSize*5
        // ================================================
        // <view 영역>
        keypadView.frame = CGRect(x: 0, y: offset, width: btnSize*4, height: btnSize*5)
        displayView.frame = CGRect(x: marginX, y: marginY, width: btnSize*4-2*marginX, height: offset-marginY)
        // ================================================
        // <keypad 내부 영역>
        etcView.frame = CGRect(x: 0, y: 0, width: btnSize*3, height: btnSize)
        numberPadView.frame = CGRect(x: 0, y: btnSize, width: btnSize*3, height: btnSize*4)
        operView.frame = CGRect(x: btnSize*3, y: 0, width: btnSize, height: btnSize*5)
    }
    
    // 버튼 리스트 생성
    func makeBtn(count: Int) -> [UIButton]
    {
        var returnList: [UIButton] = []
        for index in 0..<count
        {
            let btn = UIButton()
            btn.tag = index
            returnList.append(btn)
        }
        return returnList
    }
    
    // 버튼 위치 조정 - 매트릭스
    func arrangeBtn(btnList: [UIButton], column: Int)
    {
        let btnSize: CGFloat = self.view.frame.size.width / 4
        
        for index in 0..<btnList.count
        {
            let col = CGFloat(index % column)
            let row = CGFloat(index / column)
            
            btnList[index].frame = CGRect(x: btnSize*col, y: btnSize*row, width: btnSize, height: btnSize)
        }
    }
    
    @objc func etcHandler(_ sender: UIButton)
    {
        print(sender.titleLabel?.text)
        sender.backgroundColor = .clear
    }
    
    @objc func numberPadHandler(_ sender: UIButton)
    {
        print(sender.titleLabel?.text)
        sender.backgroundColor = .clear
    }
    
    @objc func operHandler(_ sender: UIButton)
    {
        print(sender.titleLabel?.text)
        sender.backgroundColor = .clear
    }
    
    @objc func touchDownChangeColor(_ sender: UIButton)
    {
        sender.backgroundColor = UIColor(rgb: 0xcfd9fa)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// Hex Color -> UIColor 변환
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
