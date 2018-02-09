//
//  AppDelegate.swift
//  NaviController
//
//  Created by 박성은 on 2018. 2. 9..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
//        1. vc 인스턴스 만들기
//        2. 윈도우 인스턴스 만들기
//        3. 윈도우 루트뷰컨트롤러 지정
//        0. 내비컨트롤러 만들기
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "Viewcontroller")
//
//        let navi = UINavigationController(rootViewController: vc)
//
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = navi
//        window.makeKeyAndVisible()
        
        
////        1) VC인스턴스 만들기
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC: UIViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        // 어차피 윈도우에 줄거기 때문에 타입 적지 않아도 되긴함.
//        let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController")
//
//        //        0) NavigationController
//        // 내비에서 보여줘야 하는 메인 화면이 mainVC
//        let mainNavi = UINavigationController(rootViewController: mainVC)
//
////        2) window 인스턴스 만들기
//        // AppDelegate에서 가져올 수 있는 것 : Screen Size
//        // UIScreen.main (.main의 return값 UIScreen) >> UIScreen에서 동일한 프로퍼티를 가져오는 것 : 싱글톤.
//        window = UIWindow(frame: UIScreen.main.bounds)
//
////        3) window rootVC 지정
//        // 윈도우에 가장 먼저 띄워야 하는건 내비 바
//        window?.rootViewController = mainNavi
//        // 윈도우를 키 윈도우를 만들고, 보이게 만들기.
//        // 윈도우도 여러개 만들 수 있긴 하지만 활용도 거의 없음. 웬만하면 안올리는게..
//        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

