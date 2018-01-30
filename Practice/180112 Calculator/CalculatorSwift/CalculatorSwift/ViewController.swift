//
//  ViewController.swift
//  CalculatorSwift
//
//  Created by youngmin joo on 2018. 1. 12..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var firstNumDisplay: UILabel!
    @IBOutlet weak var secondNumDisplay: UILabel!
    @IBOutlet weak var resultDisplay: UILabel!
    
    var operationTemp: String?
    
    var firstNum: String?
    {
        willSet(nextValue)
        {
            if let newValue = nextValue
            {
                firstNumDisplay.text = newValue
            }
        }
    }
    var secondNum: String? {
        willSet(nextValue)
        {
            if let newValue = nextValue
            {
                secondNumDisplay.text = newValue
            }
        }
    }
    var resultNum: String?
    
    
    //MARK: - Action Method
    
    @IBAction func clickDidNumber(_ sender: UIButton) {
       
        //버튼에 있는 텍스트 가져오기
        let numberStr: String = sender.titleLabel!.text!
        
        //연산자 유무확인
        if let _ = operationTemp
        {
            if secondNum == "0"
            {
                secondNum = numberStr
            }else
            {
                secondNum += numberStr
            }
        }else
        {
            if firstNum == "0"
            {
                resetDisplay()
                firstNum = numberStr
            }else
            {
                firstNum += numberStr
            }
        }
    }
    
    private func inputNum(_ numStr: String, tempProperty: inout String?) {
        if let num = tempProperty
        {
            tempProperty = num + numStr
        } else
        {
            tempProperty = numStr
        }
    }
    
    
    @IBAction func clickDidOperation(_ sender: UIButton) {
        let operStr = sender.titleLabel!.text!
        
        if firstNum != nil
        {
            operationTemp = operStr
            changeColor(by: operStr)
        }
    }
    
    
    @IBAction func clickDidCancel(_ sender: UIButton) {
        print("did Cancel")
        resetData()
        resetDisplay()
    }
    
    
    @IBAction func clickDidResult(_ sender: UIButton) {
        
        if let firNum = firstNum, let op = operationTemp, let secNum = secondNum
        {
            let firstNumTemp: Int = Int(firNum)!
            let secondNumTemp: Int = Int(secNum)!
//            let op: String = operationTemp!
            
            let resultNum = calculation(firstNum: firstNumTemp, operation: op, secondNum: secondNumTemp)
            resultDisplay.text = String(resultNum)
            resetData()
        }
    }
    
    
    //MARK: - Private Method
    /// 연산 함수
    /// 두수를 연산자에 따라 연산하고 결과값을 리턴해준다.
    ///
    /// - Parameters:
    ///   - firstNum: 첫번째 디스플레이에 표시된 숫자
    ///   - operation: 연산을 위한 연산자
    ///   - secondNum: 두번째 디스플레이에 표시된 숫자
    /// - Returns: 연산의 결과값
    private func calculation(firstNum: Int, operation: String, secondNum: Int) -> Int
    {
        var resultNum: Int = 0
        
        switch operation {
        case "+":
            print("더하기 연산")
            resultNum = firstNum + secondNum
        case "−":
            print("빼기 연산")
            resultNum = firstNum - secondNum
        case "×":
            print("곱하기 연산")
            resultNum = firstNum * secondNum
        case "÷":
            print("나누기 연산")
            resultNum = firstNum / secondNum
        case "%":
            print("나머지 연산")
            resultNum = firstNum % secondNum
        default:
            print("여기 걸리면 에러임!")
        }
        
        return resultNum
    }
    
    
    //데이터 리셋
    private func resetData()
    {
        firstNum = nil
        secondNum = nil
        operationTemp = nil
    }
    
    //UI 리셋
    private func resetDisplay()
    {
        firstNumDisplay.text = "0"
        secondNumDisplay.text = "0"
        resultDisplay.text = "0"
    
        //디스플레이 리셋될 때, 배경 흰색으로 바뀜
        changeLabelBG(color: UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1.0))
    }
    
    //연산자 클릭했을 때, 연산자에 컬러 지정하기
    private func changeColor(by operation: String)
    {
        var color:UIColor
        
        switch operation {
        case "+":
            color = UIColor(red: 117/255, green: 211/255, blue: 252/255, alpha: 1.0)
        case "−":
            color = UIColor(red: 140/255, green: 249/255, blue: 0/255, alpha: 1.0)
        case "×":
            color = UIColor(red: 255/255, green: 212/255, blue: 121/255, alpha: 1.0)
        case "÷":
            color = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1.0)
        case "%":
            color = UIColor(red: 122/255, green: 128/255, blue: 254/255, alpha: 1.0)
        default:
            color = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1.0)
            print("여기 걸리면 에러임!")
        }
        //앞의 color는 새로 만든 이름, 뒤에는 변수명
        //아래 컬러 바꾸기 함수 실행
        changeLabelBG(color: color)
    }
    
    // 컬러 바꾸기
    private func changeLabelBG(color: UIColor)
    {
        firstNumDisplay.backgroundColor = color
        secondNumDisplay.backgroundColor = color
        resultDisplay.backgroundColor = color
    }
}
