//
//  ViewController.swift
//  UIDeviceExample
//
//  Created by sungnni on 2018. 3. 26..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

/***************************************************
 UIDevice
 -. 디바이스 이름 / 모델 / 화면 방향 등
 -. OS이름 / 버전
 -. 인터페이스 형식 (phone, pad, tv 등)
 -. 배터리 정보
 -. 근접 센서 정보
 -. 멀티태스킹 지원 여부
 ***************************************************/


final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBOutlet private weak var label: UILabel!
    var device = UIDevice.current
    
    @IBAction private func systemVersion() {
        /***************************************************
         Version: Major, Minor (public), Minor (non-public)
         ***************************************************/
        print("\n---------- [ System Version ] -----------\n")
        print("System Name: ", device.systemName)
        print((device.systemVersion as NSString).floatValue)
        
        let systemVersion = device.systemVersion
        print(systemVersion)
        
        let splitVersion = systemVersion.split(separator: ".").flatMap { Int($0) }
        print(splitVersion)
        if splitVersion.count > 2 {
            label.text = "\(splitVersion[0]).\(splitVersion[1]).\(splitVersion[2])"
        } else {
            label.text = "\(splitVersion[0]).\(splitVersion[1])"
        }
    }
    
    
    @IBAction private func architectur() {
        print("\n---------- [ Architecture ] -----------\n")
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            print("Simulator")
            label.text = "Simulator"
        #else
            print("Device")
            label.text = "Device"
        #endif
        
        print(TARGET_OS_MAC)
        print(TARGET_OS_IOS)
        print(TARGET_CPU_X86)
        print(TARGET_CPU_X86_64)
        print(TARGET_OS_SIMULATOR)
        print(TARGET_RT_LITTLE_ENDIAN)
        print(TARGET_RT_64_BIT)
        print(TARGET_RT_LITTLE_ENDIAN)
        print(TARGET_RT_BIG_ENDIAN)
        print(TARGET_CPU_ARM)
        print(TARGET_CPU_ARM64)
    }

    @IBAction private func deviceModel() {
        print("\n---------- [ Device Model ] -----------\n")
        print(device.name)
        print(device.model)
        print(device.localizedModel)
        print(device.userInterfaceIdiom)
        print(device.orientation)
        print(device.isMultitaskingSupported) // 최신 기기에서는 항상 true
    }
    
    @IBAction private func battery() {
        /***************************************************
         public enum UIDeviceBatteryState : Int {
         case unknown
         case unplugged // on battery, discharging
         case charging // plugged in, less than 100%
         case full // plugged in, at 100% }
         ***************************************************/
        
        print("\n---------- [ Battery Info ] -----------\n")
        print(device.batteryLevel)
        print(device.batteryState) // batteryState.rawValue 일 경우에 위 case 처럼 뜸.
        // rawValue없이 enum 출력하고 싶을때 CustomStringConvertible - description 구현하면 됨.
        print(device.isBatteryMonitoringEnabled)
    }
    
    
    @IBAction private func proximateState() {
        // proximityState : 카메라 센서 인식
        // device.isProximityMonitoringEnabled -> true / false
    }
    
    @IBAction private func beginGeneratingDeviceOrientationNotification() {
        
        label.text = String(device.isGeneratingDeviceOrientationNotifications) // 기본적으로 on상태로 시작
        device.beginGeneratingDeviceOrientationNotifications() // 중첩되어 올라감 (2개)
        // device.endGeneratingDeviceOrientationNotifications()
        // 2개 이상이기 때문에 while문으로 돌려서 없애줘야 함.
        
        NotificationCenter.default.addObserver(
        forName: .UIDeviceOrientationDidChange, object: nil, queue: .main)
        { if let device = $0.object as? UIDevice {
            print(device.orientation)
        }
            print(UIApplication.shared.statusBarOrientation)
        }
    }

    
    
    
}

