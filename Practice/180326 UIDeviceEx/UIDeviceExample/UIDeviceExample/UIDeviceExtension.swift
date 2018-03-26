//
//  UIDeviceExtension.swift
//  UIDeviceExample
//
//  Created by sungnni on 2018. 3. 26..
//  Copyright © 2018년 SsungNni. All rights reserved.
//
import UIKit
import Foundation

class UIDeviceExtension {
    
    // iphoneX 인지 구분
    // height 값 check
    var isIphoneX: Bool {
//        return UIScreen.main.nativeBounds.height == 2436
        return UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale == 812
        // nativeBounds : pixel
        // nativeScale : 3X, 2X 등
    }
    
    // 아이폰인지, 패드인지 등등 구분
    var isIphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    // iOSDeviceMapping
    // plist or 다른거 잘 복사해뒀다가 쓰기
    
}
