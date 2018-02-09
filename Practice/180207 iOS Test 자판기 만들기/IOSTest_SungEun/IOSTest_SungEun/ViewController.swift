//
//  ViewController.swift
//  IOSTest_SungEun
//
//  Created by 박성은 on 2018. 2. 7..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 기능별(음료수, 결과창, 돈 넣는 창)로 구분하여 view 생성
    let itemView: UIView = UIView()
    let resultView: UIView = UIView()
    let coinView: UIView = UIView()
    
    // 음료수 Item
    var drink1: Item = Item()
    var drink2: Item = Item()
    var drink3: Item = Item()
    var drink4: Item = Item()
    
    // 결과창 Label
    var resultText: UILabel!
    var money: UILabel!
    var restMoney: Int = 0
    
    // 돈넣는 버튼
    var coin1000: UIButton!
    var coin500: UIButton!
    var coinReturn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        updateLayer()
        item()
        
        
    }
    
    // 기능별(음료수, 결과창, 돈 넣는 창) frame
    func createView()
    {
        let marginY: CGFloat = 20
        var offsetY: CGFloat = 30
        
        itemView.frame = CGRect(x: 0, y: marginY, width: self.view.frame.size.width, height: self.view.frame.size.height*0.6)
        offsetY += marginY + self.view.frame.size.height*0.6
        resultView.frame = CGRect(x: 30, y: offsetY, width: self.view.frame.size.width-60, height: self.view.frame.size.height*0.2-20)
        offsetY += 10 + self.view.frame.size.height*0.2
        coinView.frame = CGRect(x: 30, y: offsetY, width: self.view.frame.size.width-60, height: self.view.frame.size.height-offsetY)
        
        view.addSubview(itemView)
        view.addSubview(resultView)
        view.addSubview(coinView)
    }
    
    
    func updateLayer(){
        
        // 음료수 Item
        let marginX: CGFloat = 30
        let marginY: CGFloat = 15
        let offsetX: CGFloat = 15
        let offsetY: CGFloat = 15
        
        let width: CGFloat = (itemView.frame.size.width-(2*marginX + offsetX))/2
        let height: CGFloat = (itemView.frame.size.height-offsetY-marginY)/2
        
        drink1 = Item(frame: CGRect(x: marginX, y: marginY, width: width, height: height))
        drink2 = Item(frame: CGRect(x: marginX+offsetX+width, y: marginY, width: width, height: height))
        drink3 = Item(frame: CGRect(x: marginX, y: marginY+offsetY+height, width: width, height: height))
        drink4 = Item(frame: CGRect(x: marginX+offsetX+width, y: marginY+offsetY+height, width: width, height: height))
        
        // 결과창
        resultView.backgroundColor = .black
        
        resultText = UILabel()
        resultText.frame = CGRect(x: 5, y: 5, width: resultView.frame.size.width-10, height: (resultView.frame.size.height-10)/2)
        resultText.textColor = .white
        resultText.text = "결과 text"
        resultText.textAlignment = .right
        resultText.numberOfLines = 0
        resultText.font = UIFont.systemFont(ofSize: 20)
        resultView.addSubview(resultText)
        
        money = UILabel()
        money.frame = CGRect(x: 5, y: 5+(resultView.frame.size.height-10)/2, width: resultView.frame.size.width-10, height: (resultView.frame.size.height-10)/2)
        money.textColor = .white
        money.text = "잔액 : \(restMoney)원"
        money.textAlignment = .right
        money.font = UIFont.systemFont(ofSize: 20)
        resultView.addSubview(money)
        
        // 돈넣기
        coin1000 = UIButton()
        coin500 = UIButton()
        coinReturn = UIButton()
        
        let offsetBtn: CGFloat = 30
        coin1000.frame = CGRect(x: 0, y: 0, width: (coinView.frame.size.width-2*offsetBtn)/3, height: coinView.frame.size.height*0.55)
        coin500.frame = CGRect(x: (coinView.frame.size.width-2*offsetBtn)/3+offsetBtn,
                               y: 0,
                               width: (coinView.frame.size.width-2*offsetBtn)/3,
                               height: coinView.frame.size.height*0.55)
        coinReturn.frame = CGRect(x: ((coinView.frame.size.width-2*offsetBtn)/3+offsetBtn)*2, y: 0, width: (coinView.frame.size.width-2*offsetBtn)/3, height: coinView.frame.size.height*0.55)
        
        coin1000.setTitle("1000원", for: .normal)
        coin1000.setTitleColor(.black, for: .normal)
        coin1000.layer.borderWidth = 1
        coin1000.tag = 1000
        coin1000.addTarget(self, action: #selector(restMoney(_:)), for: .touchUpInside)
        coin1000.layer.borderColor = UIColor.darkGray.cgColor
        
        coin500.setTitle("500원", for: .normal)
        coin500.setTitleColor(.black, for: .normal)
        coin500.layer.borderWidth = 1
        coin500.tag = 500
        coin500.addTarget(self, action: #selector(restMoney(_:)), for: .touchUpInside)
        coin500.layer.borderColor = UIColor.darkGray.cgColor
        
        coinReturn.setTitle("반환", for: .normal)
        coinReturn.setTitleColor(.black, for: .normal)
        coinReturn.layer.borderWidth = 1
        coinReturn.tag = 0
        coinReturn.addTarget(self, action: #selector(restMoney(_:)), for: .touchUpInside)
        coinReturn.layer.borderColor = UIColor.darkGray.cgColor
        
        coinView.addSubview(coin1000)
        coinView.addSubview(coin500)
        coinView.addSubview(coinReturn)
    }
    
    @objc func restMoney(_ sender: UIButton) {
        switch sender.tag {
        // 1000원, 500원 버튼을 누른 경우
        case 1000, 500:
            resultText.text = "\(sender.tag)원을 넣었습니다."
            restMoney += sender.tag
            money.text = "잔액 : \(restMoney)원"
        // 반환 버튼을 누른 경우
        case 0:
            resultText.text = "\(restMoney)원이 반환됩니다."
            restMoney = 0
            money.text = "잔액 : \(restMoney)원"
        default:
            print("error")
        }
    }
    
    func item() {
        drink1.img = #imageLiteral(resourceName: "drink1.png")
        drink1.price = "1000원"
        drink1.index = 1
        drink1.addTarget(self, action: #selector(itemClick(_:)), for: .touchUpInside)
        itemView.addSubview(drink1)
        
        drink2.img = #imageLiteral(resourceName: "drink2.png")
        drink2.price = "800원"
        drink2.index = 2
        drink2.addTarget(self, action: #selector(itemClick(_:)), for: .touchUpInside)
        itemView.addSubview(drink2)
        
        drink3.img = #imageLiteral(resourceName: "drink3.png")
        drink3.price = "1500원"
        drink3.index = 3
        drink3.addTarget(self, action: #selector(itemClick(_:)), for: .touchUpInside)
        itemView.addSubview(drink3)
        
        drink4.img = #imageLiteral(resourceName: "drink4.png")
        drink4.price = "500원"
        drink4.index = 4
        drink4.addTarget(self, action: #selector(itemClick(_:)), for: .touchUpInside)
        itemView.addSubview(drink4)
    }
    
    @objc func itemClick(_ sender: UIButton)
    {
        var itemPrice = 0
        var itemName = ""
        
        switch sender.tag {
        case 1:
            itemPrice = 1000
            itemName = "콜라"
        case 2:
            itemPrice = 800
            itemName = "사이다"
        case 3:
            itemPrice = 1500
            itemName = "칸타타"
        case 4:
            itemPrice = 500
            itemName = "생수"
        default:
            print("error")
        }
        if restMoney >= itemPrice
        {
            resultText.text =
            """
            \(itemName)를 선택하였습니다.
            \(itemPrice)원이 차감됩니다.
            """
            restMoney -= itemPrice
            money.text = "잔액 : \(restMoney)원"
        } else
        {
            let needMoney = itemPrice - restMoney
            resultText.text =
            """
            잔액이 부족합니다.
            \(needMoney)원을 더 넣어주세요.
            """
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

