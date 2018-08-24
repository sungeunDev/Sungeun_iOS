//
//  AppDelegate.swift
//  LifeCycle
//
//  Created by 박성은 on 2018. 2. 5..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

  // 앱을 실행할 때 최초로 실행할 코드를 작성하면 좋습니다.
  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    return true
  }
  
  // 앱의 화면이 사용자에게 보여지기 직전에 최종 초기화 작업을 진행할 수 있습니다.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        //storyboard 인스턴스 생성
//        let storyboard = UIStoryboard(name: "StoryboardConnect", bundle: nil)
//        // 초기화 view Controller
//        // 에러? 왜????
//        let ViewController2: ViewController3 = storyboard.instantiateInitialViewController() as! ViewController3
//
//        // screen size에 대한 bounds
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = ViewController2
//        // 화면에 띄우기
//        window?.makeKeyAndVisible()
        return true
    }
  
  
  // Foreground에서 다른 상태로 갈것임을 알려줌
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    print("resign active")
    }

  // 앱이 백그라운드에서 돌아감. 언제든지 suspended 상태로 갈 수 있음.
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    print("enter background")
    }

  // 백에서 fore로 갈거라는걸 알려줌. but 아직 active 상태는 아님.
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    print("enter foreground")
    }
  

//  앱이 이제 ForeGround로 갈거라는걸 알려줌
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    print("become active")
    }

  // 앱이 종료될 걸 알려줌. 앱이 만약 suspended 상태라면 호출되지 않음. & 사용자가 종료한 경우에도 호출되지 않음.
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    print("terminate")
    }
}

