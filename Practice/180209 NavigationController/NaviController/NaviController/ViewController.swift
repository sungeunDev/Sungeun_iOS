//
//  ViewController.swift
//  NaviController
//
//  Created by 박성은 on 2018. 2. 9..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

// 기본적으로. 상수는 class 밖에. 얘는 변수.
let key = "UserNameList"
class ViewController: UIViewController {
    
    @IBOutlet weak var mainTf: UITextField!
    
    @IBOutlet weak var pwTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        해당 뷰에서 상위 윈도우 / 내비 컨트롤러 불러올 수 있음
        //        self.view.window
        //        self.navigationController?.topViewController
        
        // 스토리보드 내에 해당 뷰컨트롤러가 존재하면 self.storyboard로 이용 가능.
        //        self.storyboard
        
        self.navigationItem.title = "Main"
        let icon = UIImageView(image: #imageLiteral(resourceName: "images.jpg"))
        
        // 바 버튼 아이템 크기 수정에 frame base 코드는 안먹음. 오토레이아웃은 ok
        // UIBarButtonItem은 UIView가 아니기 때문에 오토레이아웃은 다른 UIView에 잡고 넣어줘야 함.
        
        icon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        icon.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: icon)
        
        let leftBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.camera, target: self, action: #selector(leftAction(_:)))
        leftBtn.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.navigationItem.leftBarButtonItem = leftBtn
        
        self.navigationItem.title = "메인 페이지"
        
        // 전체 네비 바. 한 화면에서 없애면 전체 없어짐
        // 다른 화면에서 hidden 값 false로 재설정하면 다시 나타남.
        //        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    @objc func leftAction(_ item: UIBarButtonItem)
    {
        
    }
    
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "NextVC")
        self.navigationController?.pushViewController(nextvc!, animated: true)
        // 아래는 컨트롤러의 타이틀. 내비 "아이템"의 타이틀을 찾아야 함.
        //        self.navigationController?.title
    }
    
    @IBAction func add(_ sender: Any) {
//        if var list = UserDefaults.standard.array(forKey: key) as? [String]
//        {
//            list.append(mainTf.text!)
//            UserDefaults.standard.set(list, forKey: key)
//        } else
//        {
//            let newNameList = [mainTf.text]
//            UserDefaults.standard.set(newNameList, forKey: key)
//        }
        if var list2 = UserDefaults.standard.bool(forKey: <#T##String#>)
        
        
                if var list2 = UserDefaults.standard.array(forKey: "회원가입") as? [[String: String]]
                {
                    list2.append([mainTf.text!:"id", pwTf.text!:"pw"])
                    UserDefaults.standard.set(list2, forKey: "회원가입")
                } else
                {
                    let newNameList = [mainTf.text!:"id", pwTf.text!:"pw"]
                    UserDefaults.standard.set([newNameList], forKey: "회원가입")
                }
    }
    
    //        func dic()
    //        {
    //            var dic: [String: String] = [:]
    //            dic.updateValue("ganadara", forKey: "id")
    //            dic.updateValue("pw", forKey: "pw")
    //
    //            var array: Array = [dic]
    //            print(array)
    //        }
    
    @IBAction func printAction(_ sender: Any) {
//        if var list = UserDefaults.standard.array(forKey: key) as? [String]
//        {
//            print(list)
            //            for name in list
            //            {
            //                if mainTf.text == name
            //                {
            //                    print("찾았다.")
            //                } else
            //                {
            //                    print("없다.")
            //                }
            //            }
            
        if var list2 = UserDefaults.standard.array(forKey: "회원가입") as? [[String: String]]
        {print(list2)}
        }
    
    
        @IBAction func loginAction(_ sender: Any) {
            if var list2 = UserDefaults.standard.array(forKey: "회원가입") as? [[String: String]]
            {
                for index in 0..<list2.count
                {
                    if list2[index]["id"] == mainTf.text && list2[index]["pw"] == pwTf.text
                    {
                        print("로그인하세요")
                    } else
                    {
                       print("아이디랑 비번이 일치하지 않습니다.")
                    }
                }
            }
        }
    
    @IBAction func removeBtn(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "회원가입")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

