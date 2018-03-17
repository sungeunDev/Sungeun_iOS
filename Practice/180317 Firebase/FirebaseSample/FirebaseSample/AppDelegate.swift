//
//  AppDelegate.swift
//  FirebaseSample
//
//  Created by sungnni on 2018. 3. 17..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
        -> Bool {
            FirebaseApp.configure()
            return true
    }
}

