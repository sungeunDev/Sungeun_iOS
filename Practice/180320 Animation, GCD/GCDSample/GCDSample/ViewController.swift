//
//  ViewController.swift
//  GCDSample
//
//  Created by sungnni on 2018. 3. 20..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bigTaskOnMainThread()
    }
    
    private func bigTaskOnMainThread() {
        print("big task start")
        for _ in 0...900_000_000 { _ = 1 + 1}
        print("big task end. start UI task")
        
        // 위의 task가 다 끝나야 배경색 변경됨.
        view.backgroundColor = .magenta
    }
    
    private func bigTaskOnGlobalThread() {
        print("big task start")
        DispatchQueue.global().async {
            for _ in 0...900_000_000 { _ = 1 + 1}
            print("big task end. start UI task")
        }
        // 위의 task가 다 끝나야 배경색 변경됨.
        view.backgroundColor = .magenta
    }
    
    
    private func uiTaskOnBackgroundThread() {
        DispatchQueue.global().async { [weak self] in
            for _ in 0...900_000_000 { _ = 1 + 1}
            
            DispatchQueue.main.async {
                self?.testView.frame.origin.y += 250
                self?.view.backgroundColor = .yellow
            }
        }
    }
    
    private func performanceTest() {
        let serialQueue = DispatchQueue(label: "test.serialQueue")
        let concurrentQueue = DispatchQueue(label: "test.concurrentQueue", attributes: [.concurrent])
        let maxCount = 60_000
        
        // serialQueue .async / .sync
        // concurrentQueue .async / .sync
    }
}

