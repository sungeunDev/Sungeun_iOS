//
//  ViewController.swift
//  URLScheme
//
//  Created by sungnni on 2018. 3. 16..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Apple URL Scheme Reference
    // https://developer.apple.com/library/content/featuredarticles/iPhoneURLScheme_Reference/Introduction/Introduction.html
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction private func openSetting() {
        guard let settingURL = URL(string: UIApplicationOpenSettingsURLString),
            UIApplication.shared.canOpenURL(settingURL) // 주소를 열수 있는지 체크. Bool 값 반환
            else { return }
        if #available(iOS 10.0, *) { // 10.0 이상
            UIApplication.shared.open(settingURL)
//            UIApplication.shared.open(<#T##URL#>, options: <#T##[String : Any]#>, completionHandler: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//            열렸을때, 열리지 않았을 때 ~ 작업.
//            옵션, 핸들러는 디폴트 설정되어 있어서 open까지만 해도 됨.
            
        } else { // 이하
            UIApplication.shared.openURL(settingURL)
        }
    }
    
    @IBAction private func openMail() {
        // 메일 앱으로 이동
        let mailURL = URL(string: "mailto://starfg62@gmail.com")!
//        let mailURL = URL(string: "mailto://someone@mail.com")! // 받는 사람
        if UIApplication.shared.canOpenURL(mailURL) {
            UIApplication.shared.open(mailURL)
        }
    }

    @IBAction private func openMessage() {
        let url = URL(string: "sms://폰번호")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction private func openWebsite() {
        let url = URL(string: "https://google.com")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    /***************************************************
     화이트리스트 등록 방법 - info.plist
     <key>LSApplicationQueriesSchemes</key>
     <array>
     <string>myApp</string>
     <string>fb</string>
     </array>
     ***************************************************/
    @IBAction private func openFacebook() {
        // 열리지 않음. canOpenURL = false. 화이트리스트 등록 필요
        let url = URL(string: "fb://")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction private func openMyApp() {
        let url = URL(string: "myApp://?name=abc&age=10")!
        print(UIApplication.shared.canOpenURL(url))
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
   
    
    
    
}

