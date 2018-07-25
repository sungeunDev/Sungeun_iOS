//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by sungnni on 2018. 3. 26..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 컨트롤러의 뷰가 메모리에 올라오고 나서 호출됨
        // 뷰 불러왔을 때(메모리에 올라왔을 때) 한번만 호출됨
    }

    override func loadView() {
        super.loadView()
        /***************************************************
         -. loadView를 호출하면, Interface builder(Storyboard) 호출 X
         -. 스토리보드 사용 없이 하드코딩할때 이용.
         -. loadView 활용해서 custom하게 뷰 구현할 경우, super.loadView()를 호출하면 안됨.
            (호출시, 스토리보드대로 뷰 구성하게 됨)
         ***************************************************/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 뷰가 나타날 때마다(ex. 화면 전환) 여러번 호출됨
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

