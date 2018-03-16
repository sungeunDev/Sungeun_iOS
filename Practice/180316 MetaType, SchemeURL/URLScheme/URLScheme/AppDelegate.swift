//
//  AppDelegate.swift
//  URLScheme
//
//  Created by sungnni on 2018. 3. 16..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    /***************************************************
     앱 종료상태에서는
     -. didFinishLaunchingWithOptions
     -. open:options 순으로 호출
     
     앱이 이미 실행중일 경우는 open:options만 호출
     ***************************************************/    
}

