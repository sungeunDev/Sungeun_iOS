//
//  AppDelegate.swift
//  kakaoTest
//
//  Created by sungnni on 2018. 3. 29..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

// 전역변수로 처리할수도..
//let appDelegate = UIApplication.shared.delegate (as! AppDelegate)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // 바로 접근할 수 있도록 만들어둔 것.
    static var instance: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        initializeApp()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        KOSession.handleDidEnterBackground()
    }


    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
        
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url) {
            return KOSession.handleOpen(url)
        }
        return false
    }
    
    // didFinishLaunchingWithOptions 에서 호출
    private func initializeApp() {
        setupSessionChangeNotification()
        setupRootViewController()
    }
    
    // 세션 변경된 경우, add Observer
    private func setupSessionChangeNotification() {
        NotificationCenter.default.addObserver(
            forName: Notification.Name.KOSessionDidChange,
            object: nil,
            queue: .main) { [unowned self] noti in
                guard let session = noti.object as? KOSession else { return }
                session.isOpen() ? print("Login") : print("Logout")
                self.setupRootViewController()
        }
    }
    
    // rootView 설정
    private func setupRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        // 로그인 한 경우, 메인 뷰로 가기
        if KOSession.shared().isOpen() {
            let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            navigationController.viewControllers = [mainVC]
        } else {
            // 로그인 안된경우, 로그인 페이지로 보내기
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LogOutViewController") as! LogOutViewController
            navigationController.viewControllers = [loginVC]
        }
        window?.rootViewController = navigationController
    }
}

