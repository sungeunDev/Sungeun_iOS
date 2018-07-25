//
//  AppDelegate.swift
//  AppLifeCycle
//
//  Created by sungnni on 2018. 3. 26..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /***************************************************
     < App Launch Sequence >
     
     // 건들 수 없음
     start : main
     -> UIApplicationMain()
     -> Load main UI file (storyboard)
     
     <AppDelegate>
     // custom 가능한 부분
     -> First init : willFinishLaunchingWithOptions
     -> Restore : various Method
     -> Final init : didFinishLaunchingWithOptions
                     ㄴ 한번만 호출
     
     <ViewController>
     -> viewDidLoad
     -> viewWillAppear
     -> viewDidAppear
     -> viewwillDisappear
     -> viewDidDisappear
     
     <AppDelegate>
     -> didBecomeActive : 활성화 될 때마다 호출(여러번 호출 가능)
     -> willResign : 앱 사용 중 SMS으로 알림이 뜰 경우 등에 사용하던 앱이 resign 됨
     -> DidEnterBackground : resource로 인해서 background에 있던 앱이 죽는 경우가 있으므로 유저 데이터 저장 등 처리하는 걸 여기에서 해줘야 함
     
     -> willEnterForeground
     -> didBecomeActive
     
     -> willResign
     -> DidEnterBackground
     -> willTerminnate : 백그라운드에서 앱 종료시 호출 안됨.
     ***************************************************/
    
    
    // will -> did Finish
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("willFinishLaunchingWithOptions")
        return true
    }
    
    // 호출 권장 X
    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("applicationDidFinishLaunching")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions")
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

