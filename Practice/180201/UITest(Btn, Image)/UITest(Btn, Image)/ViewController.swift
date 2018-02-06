//
//  ViewController.swift
//  UITest(Btn, Image)
//
//  Created by 박성은 on 2018. 2. 1..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedBtn: UIButton?
    var centerTextLb: UILabel!
    var selectedList: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 레이블
        let titleLb: UILabel = UILabel(frame: CGRect(x: 0, y: 70, width: view.frame.size.width, height: 150))
        titleLb.text = "UI Test View"
        titleLb.textColor = .white
        //        titleLb.textAlignment = NSTextAlignment.center
        titleLb.textAlignment = .center
        titleLb.font = UIFont.systemFont(ofSize: 50, weight: .medium)
        view.addSubview(titleLb)
        
        // ~Lb : Label
        // 그냥 text와 구분하는 용도.
        centerTextLb = UILabel(frame: CGRect(x: 0, y: view.frame.size.height/2 - 120, width: view.frame.size.width, height: 20))
        
        centerTextLb.text =
        """
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
        centerTextLb.font = UIFont.systemFont(ofSize: 25)
        //        centerTextLb.backgroundColor = .orange
        centerTextLb.textColor = .white
        centerTextLb.textAlignment = .right
        centerTextLb.numberOfLines = 3
        // byCharWrapping Vs. byWordWrapping 의 차이?!!
        //        centerTextLb.lineBreakMode = .byWordWrapping
        centerTextLb.baselineAdjustment = .alignCenters
        centerTextLb.sizeToFit()
        
        view.addSubview(centerTextLb)
        
        
        // 이미지
        
        // let kakaoConImg: UIImage = UIImage(named: "kakaoCon.png")!
        // 개발자가 실수를 하면 안돼는 부분은 일부러 크러쉬가 나도록 !를 주기도 함.
        // 데이터를 받아서 처리하는 경우에는 안전하게 ? 이용.
        let kakaoConImg: UIImage? = UIImage(named: "bg")
        
        let bgImgView: UIImageView = UIImageView(frame: view.bounds)
        bgImgView.image = kakaoConImg
        bgImgView.contentMode = UIViewContentMode.scaleAspectFit
        view.insertSubview(bgImgView, at: 0)
        
        let bgWhite: UIView = UIView(frame: bgImgView.bounds)
        bgWhite.backgroundColor = #colorLiteral(red: 0.2104298174, green: 0.4457278848, blue: 0.3139350712, alpha: 1)
        bgWhite.alpha = 0.5
        bgImgView.addSubview(bgWhite)
        
        let conimg2: UIImage = UIImage(named: "images.jpg")!
        let con2View: UIImageView = UIImageView(frame: CGRect(x: 0, y: 500, width: view.frame.size.width, height: 160))
        con2View.image = conimg2
        con2View.contentMode = UIViewContentMode.scaleAspectFill
        bgImgView.addSubview(con2View)
        
        
        // 버튼
        let logoBtn: UIButton = UIButton(type: .custom)
        logoBtn.frame = CGRect(x: 30, y: 30, width: 60, height: 60)
        //        logoBtn.tintColor = .white
        logoBtn.setTitle("왼쪽", for: .normal)
        logoBtn.setTitleColor(.blue, for: .normal)
        logoBtn.setTitleColor(.red, for: .selected)
        //        logoBtn.setImage(#imageLiteral(resourceName: "images.jpg"), for: .normal)
        logoBtn.tag = 1
        logoBtn.addTarget(self, action: #selector(logoEventTouchUpInside(_:)), for: .touchUpInside)
        view.addSubview(logoBtn)
        
        
        let logoBtn2: UIButton = UIButton(type: .custom)
        logoBtn2.frame = CGRect(x: 100, y: 30, width: 60, height: 60)
        logoBtn2.setTitle("중간", for: .normal)
        logoBtn2.setTitleColor(.blue, for: .normal)
        logoBtn2.setTitleColor(.red, for: .selected)
        logoBtn2.tag = 2
        logoBtn2.addTarget(self, action: #selector(logoEventTouchUpInside(_:)), for: .touchUpInside)
        view.addSubview(logoBtn2)
        
        let logoBtn3: UIButton = UIButton(type: .custom)
        logoBtn3.frame = CGRect(x: 170, y: 30, width: 60, height: 60)
        logoBtn3.setTitle("오른쪽", for: .normal)
        logoBtn3.setTitleColor(.blue, for: .normal)
        logoBtn3.setTitleColor(.red, for: .selected)
        logoBtn3.tag = 3
        logoBtn3.addTarget(self, action: #selector(logoEventTouchUpInside(_:)), for: .touchUpInside)
        view.addSubview(logoBtn3)
        
        let resultBtn: UIButton = UIButton(type: .custom)
        resultBtn.frame = CGRect(x: 30, y: 90, width: 100, height: 60)
        resultBtn.backgroundColor = .white
        resultBtn.setTitleColor(.black, for: .normal)
        resultBtn.setTitle("결과", for: .normal)
        resultBtn.addTarget(self, action: #selector(touchedLogoTagResult(_:)), for: .touchUpInside)
        view.addSubview(resultBtn)
        
    }
    
    // 다른 버튼이 같은 이벤트를 터치할 때, 1) tag로 구분해서 if문 사용
    // 혹은 2) 전역변수 활용
    
    // 여러개 중에 1개만 선택할 때의 로직.
    
    
    @objc func logoEventTouchUpInside(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isSelected = true
            if selectedList.count == 0 {
                selectedList.append(sender)
            }else {
                for index in 0..<selectedList.count {
                    if sender.tag != selectedList[index].tag {
                        selectedList.append(sender)
                        break
                    }
                }
            }
        }else {
            sender.isSelected = false
            for index in 0..<selectedList.count {
                if sender.tag == selectedList[index].tag {
                    selectedList.remove(at: index)
                }
            }
        }
    }
    
    
    @objc func touchedLogoTagResult(_ sender: UIButton )
    {
        for _ in 0..<selectedList.count
        {
//            let result = selectedList[index].tag
            print(selectedList)
        }
    }
    
    //    @objc func logoEventTouchUpInside(_ sender: UIButton)
    //    {
    //        if sender.isSelected == false
    //        {
    //            //            주석 해제할 경우, selectedBtn은 초기 ? 값이기 때문에 아래 구문 실행 X. true로 안변함.
    //            //            맨 아래 result guard문을 통해서 옵셔널 처리해주기 때문에 nil값 출력 X
    //            //            if let selectedBtn = selectedBtn
    //            //            {
    //            //            selectedBtn?.isSelected = false
    //            sender.isSelected = true
    //            //            }
    //            //            selectedBtn = sender
    //
    //            //            guard let sList = selectedList else {return}
    //
    //            if selectedList.count == 0
    //            {
    //                selectedList.append(sender)
    //            }else
    //            {
    //                for index in 0..<selectedList.count
    //                {
    //                    if sender.tag != selectedList[index].tag
    //                    {
    //                        selectedList.append(sender)
    //                    }
    //                }
    //            }
    //
    //        }else
    //        {
    //            sender.isSelected = false
    //            //          nil 처리하지 않으면, 결과 버튼 눌렀을 때 마지막으로 눌렀던 버튼의 결과값 출력됨
    //            //            selectedBtn = nil
    //
    //            //            guard let sList = selectedList else {return}
    //            for index in 0..<selectedList.count
    //            {
    //                if sender.tag == selectedList[index].tag
    //                {
    //                    selectedList.remove(at: index)
    //                }
    //            }
    //        }
    //    }
    //
    //
    //    @objc func touchedLogoTagResult(_ sender: UIButton )
    //    {
    //        //        guard let sBtn = selectedBtn else { return }
    //        //        print(sBtn.tag)
    //        //        centerTextLb.text = String(sBtn.tag)
    //
    //        //        if let sBtn = selectedBtn
    //        //        {
    //        //            print(sBtn.tag)
    //        //            centerTextLb.text = String(sBtn.tag)
    //        //        }
    //
    //        //        guard let sList = selectedList else {return}
    //        for index in 0..<selectedList.count
    //        {
    //            let result = selectedList[index].tag
    //            print(result)
    //
    //        }
    //    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

