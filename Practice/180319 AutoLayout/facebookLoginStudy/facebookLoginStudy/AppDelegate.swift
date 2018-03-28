//
//  AppDelegate.swift
//  facebookLoginStudy
//
//  Created by sungnni on 2018. 3. 19..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
  
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        let handled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
//        return handled
//    }
    
    // iOS 10 이상을 사용하는 경우 다음 코드를 사용하여 위 샘플의 마지막 호출을 변경할 수 있습니다.
    // 이렇게 하면 더욱 다양한 옵션을 사용할 수 있습니다.
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        return handled
    }
//    출처: http://tom7930.tistory.com/49 [Dr.kim의 나를 위한 블로그]
    
}

