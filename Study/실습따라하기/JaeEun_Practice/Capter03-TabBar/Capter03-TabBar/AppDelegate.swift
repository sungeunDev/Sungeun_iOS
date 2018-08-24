//
//  AppDelegate.swift
//  Capter03-TabBar
//
//  Created by sungnni on 2018. 4. 4..
//  Copyright © 2018년 ssungnni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let tabBarController = self.window?.rootViewController as? UITabBarController {
            if let tabBarItems = tabBarController.tabBar.items {
//                tabBarItems[0].image = UIImage(named: "calendar.png")
//                tabBarItems[1].image = UIImage(named: "file-tree.png")
//                tabBarItems[2].image = UIImage(named: "photo.png")

                tabBarItems[0].image = UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal)
                tabBarItems[1].image = UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
                tabBarItems[2].image = UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
                
                tabBarItems[0].title = "Calendar"
                tabBarItems[1].title = "file"
                tabBarItems[2].title = "Photo"
                
                for tbItem in tabBarItems {
                    let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = image
                }
                
                
//                tabBarController.tabBar.tintColor = UIColor.white
                
//                tabBarController.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")
                // 이미지가 탭바 사이즈보다 작고, 신축성 설정 안할 경우 바둑판 형식으로 반복 배치
                
                
                /***************************************************
                 < StretchableImage, 신축성 옵션 설정 >
                 let image = UIImage(named: "connectivity-bar")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 16)
                 tabBarController.tabBar.backgroundImage = image
                 -. 신축성 옵션 설정.
                 -. 이미지가 탭바 사이즈보다 클 경우, 탭바 범위를 벗어나 전체 이미지를 표현함.
                 
                 < UIColor Pattern / ClipsToBounds >
                 tabBarController.tabBar.barTintColor = UIColor(patternImage: image!)
                 -. UIColor - 이미지를 패턴처리하여 색상처럼 사용 가능
                 -. 컬러로 처리되어 (신축성 적용 불가) + (탭바 보다 이미지 사이즈가 클 경우, 탭바 사이즈를 초과해서 이미지가 나타나지 않음)
                 -. 이미지 수정 곤란하거나, 이미지의 크기를 미리 알 수 없을 경우 barTintColor를 통해 패턴 형식으로 처리
                 -. 혹은 tabBar.clipsToBounds = true 로 잘라내도 됨.
                 ***************************************************/
                

            }
        }
        
        
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

