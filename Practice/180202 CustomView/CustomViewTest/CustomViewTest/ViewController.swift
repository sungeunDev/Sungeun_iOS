//
//  ViewController.swift
//  CustomViewTest
//
//  Created by 박성은 on 2018. 2. 2..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstTest: MatrixPractice!
    var secondTest: MatrixPractice!
    var thirdTest: MatrixPractice!
    var fourthTest: MatrixPractice!
    
    var iconList: [MatrixPractice] = []
    
    //    var basic : CustomView!
    //    var ryan: CustomView!
    //    var con: CustomView!
    //    var appeach: CustomView!
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var marginX = 50
        var marginY = 150
        let offset = 15
        
        firstTest = MatrixPractice.init(frame: CGRect(x: marginX, y: marginY, width: 150, height: 200))
        firstTest.title(title: "첫번째", subtitle: "콘")
        firstTest.image(named: "con.jpg")
        firstTest.addTarget(self, action: #selector(touchUp(_:)), for: .touchUpInside)
        firstTest.tag(1)
        self.view.addSubview(firstTest)
        
        marginX += offset + 150
        secondTest = MatrixPractice.init(frame: CGRect(x: marginX, y: marginY, width: 150, height: 200))
        secondTest.title(title: "두번째", subtitle: "카카오친구들")
        secondTest.image(named: "kakaoFrd")
        secondTest.addTarget(self, action: #selector(touchUp(_:)), for: .touchUpInside)
        secondTest.tag(2)
        self.view.addSubview(secondTest)
        
        marginX -= offset + 150
        marginY += offset + 150
        thirdTest = MatrixPractice.init(frame: CGRect(x: marginX, y: marginY, width: 150, height: 200))
        thirdTest.title(title: "세번째", subtitle: "어피치")
        thirdTest.image(named: "appeach")
        thirdTest.addTarget(self, action: #selector(touchUp(_:)), for: .touchUpInside)
        thirdTest.tag(3)
        self.view.addSubview(thirdTest)
        
        marginX += offset + 150
        fourthTest = MatrixPractice.init(frame: CGRect(x: marginX, y: marginY, width: 150, height: 200))
        fourthTest.title(title: "네번째", subtitle: "라이언")
        fourthTest.image(named: "ryan")
        fourthTest.addTarget(self, action: #selector(touchUp(_:)), for: .touchUpInside)
        fourthTest.tag(4)
        self.view.addSubview(fourthTest)
        
        iconList = [firstTest, secondTest, thirdTest, fourthTest]
        arrangeMatrix(list: iconList, column: 2, btnSize: 180)
        
    }
    
    // MatrixPractice 를 받아오는 것 같지만 실제로는 UIButton을 받는 것
    @objc func touchUp(_ sender: UIButton){
        print("\(sender.tag) 버튼을 클릭하였습니다.")
        //        print("아무 일도 일어나지 않았다.")
    }
    
    func makeList(count: Int) -> [MatrixPractice] {
        var returnResult: [MatrixPractice] = []
        
        for index in 0..<count
        {
            let matrix: MatrixPractice = MatrixPractice()
            matrix.tag = index
            returnResult.append(matrix)
        }
        return returnResult
    }
    
    func arrangeMatrix(list: [MatrixPractice], column: Int, btnSize: CGFloat){
        
        for index in 0..<list.count
        {
            let col = CGFloat(index % column)
            let row = CGFloat(index / column)
            
            list[index].frame = CGRect(x: col*btnSize, y: row*btnSize, width: btnSize, height: btnSize)
        }
    }
    
    
    
    
    
    //        let viewOffsetX = view.frame.size.width
    //        var customViewOffset: CGFloat = 15
    //
    //        // 기본
    //        basic = CustomView.init(frame: CGRect(x: 20, y: 40, width: viewOffsetX-40, height: 150))
    //        basic.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
    //        view.addSubview(basic)
    //
    //        // 라이언의 y값
    //        customViewOffset += 40 + 150
    //        // 라이언
    //        ryan = CustomView.init(frame: CGRect(x: 20, y: customViewOffset, width: viewOffsetX-40, height: 150))
    //        ryan.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
    //        ryan.profileTitle = "라이언"
    //        ryan.descriptionTitle = "둥둥섬의 왕위 계승자로 태어난 수사자 라이언. 무뚝뚝한 표정과는 다르게 배려심이 많고 따뜻한 리더십을 가지고 있습니다. 하지만 다른 가족들과는 다르게 갈기가 없는 자신의 모습에 정체성의 혼란을 느껴 왕의 자리에 오르기보다는 또 다른 세상에 대한 호기심을 키웁니다. 왕궁에서의 반복되는 일상의 지루함을 느끼던 어느 날, 라이언은 둥둥섬을 탈출하기 위한 준비를 시작하고, 기회를 보던 차에 드디어 둥둥섬 탈출에 성공합니다. 섬을 벗어나 도착한 곳은 책으로만 접하며 동경해 왔던 신비의 장소인 바로 Secret Forest! 그곳에서 라이언은 생각지도 못했던 친구들을 만나며, 흥미로운 이야기들을 만들어 갑니다."
    //
    //        ryan.layer.borderColor = UIColor.darkGray.cgColor
    //        ryan.layer.borderWidth = 5
    //        ryan.backgroundColor = .gray
    //        ryan.img = #imageLiteral(resourceName: "ryan.png")
    //        view.addSubview(ryan)
    //
    //        // 콘의 y값
    //        customViewOffset += 150 + 15
    //        con = CustomView.init(frame: CGRect(x: 20, y: customViewOffset, width: viewOffsetX-40, height: 150))
    //        con.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
    //        con.profileTitle = "콘"
    //        con.descriptionTitle = "Friends City 외곽의 비밀스러운 장소인 Con Lab에는 나이를 알 수 없는 신비로운 표정의 꼬마 악어 콘이 홀로 연구에 몰두하고 있습니다. 혼자만의 외로운 연구에 지쳐가던 어느 날, 콘은 평생의 동반자로 지낼 친구를 만들기로 결심하고 마침내 무지를 탄생시킵니다. 하지만 귀여워 보이는 토끼의 모습과는 다르게 무지의 정체는 사실 단무지였습니다. 무지를 키우는 데 여념이 없는 콘과는 다르게 커가면서 점차 자아가 강해지는 무지는 바깥세상에 대한 호기심을 참지 못하고 늘 탈출을 시도합니다. 이를 지켜보던 콘은 결국 다른 친구들과의 만남을 허락하지만, 항상 무지 주변을 맴돌며 관찰합니다."
    //        con.img = UIImage(named: "con.jpg")!
    //
    //        con.layer.borderColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
    //        con.layer.borderWidth = 5
    //        con.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    //        view.addSubview(con)
    //
    //        // 어피치의 y값
    //        customViewOffset += 150 + 15
    //        appeach = CustomView.init(frame: CGRect(x: 20, y: customViewOffset, width: viewOffsetX-40, height: 150))
    //        appeach.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
    //        appeach.profileTitle = "어피치"
    //        appeach.descriptionTitle = "Secret Forest의 복숭아 농장에서 유전자 변이로 태어난 어피치. Secret Forest의 풍부한 햇살을 받아 유독 돋보이는 분홍색을 띱니다. 복숭아 농장에서 탈출한 뒤, Friends City에서 맨 처음 튜브를 만나게 됩니다. 튜브와의 인연으로 Friends City에서 어피치는 다양한 친구들을 만나며 흥미로운 경험을 하게 됩니다. 섹시한 뒤태와 아름다운 분홍빛을 무기로 친구들을 유혹해 보지만, 본능적인 장난기 때문인지 친구들은 항상 어피치를 경계합니다. 그럼에도 아랑곳하지 않고 넘치는 흥을 뿜어내며 오늘도 어피치는 친구들에게 장난을 겁니다."
    //        appeach.img = UIImage(named: "appeach.png")!
    //
    //        appeach.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    //        appeach.layer.borderWidth = 5
    //        appeach.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
    //        view.addSubview(appeach)
    //    }
    //
    //    @objc func touchBtn(_ sender: UIButton)
    //    {
    //        sender.setTitle("버튼 선택", for: .normal)
    //        sender.setTitle("누르는 중", for: .highlighted)
    //        sender.backgroundColor = .orange
    //    }
    //
    //
    //    func printAllFontName()
    //    {
    //        let familyNames = UIFont.familyNames
    //        for fn in familyNames
    //        {
    //            print("====\(fn)===")
    //
    //            let fontNames = UIFont.fontNames(forFamilyName: fn)
    //            for fontName in fontNames
    //            {
    //                print("ㄴ>>\(fontName)")
    //            }
    //        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

