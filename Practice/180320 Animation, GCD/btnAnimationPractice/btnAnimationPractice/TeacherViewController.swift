//
//  TeacherViewController.swift
//  btnAnimationPractice
//
//  Created by sungnni on 2018. 3. 20..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

// 강사님이랑 같이 만들기
class TeacherViewController: ViewController {
    
    // 매번 값 넣어주기보다 관리할 수 있는 구조로 만들기
    struct Time {
        static let short = 0.3
        static let mid = 0.65
        static let long = 1.0
    }
    
    private struct UI {
        static let menuCount = 6
        static let menuSize: CGFloat = 60
        static let distance: CGFloat = 70
        static let minScale: CGFloat = 0.1
    }
    
    private var firstMenuContainer: [UIButton] = []
    private var secondMenuContainer: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFirstMenu()
        setupSecondMenu()
    }
    
    // 랜덤 컬러 생성
    // 1) RGB에 들어갈 랜덤 숫자 생성
    private func randomNumberGenerator(maximum: UInt32) -> CGFloat {
        return CGFloat(arc4random_uniform(maximum))
    }
    
    // 2) 숫자 대입해서 color 생성
    private func randomColorGenerator() -> UIColor {
        let red = randomNumberGenerator(maximum: 255) / 255.0
        let green = randomNumberGenerator(maximum: 255) / 255.0
        let blue = randomNumberGenerator(maximum: 255) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    // 버튼 생성
    private func makeMenuButtonWith(frame: CGRect, title: String) -> UIButton {
        let button = UIButton(frame: frame)
        button.backgroundColor = randomColorGenerator()
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = button.bounds.width / 2
        button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(button)
        return button
    }
    
    private func setupFirstMenu() {
        for i in 0..<UI.menuCount {
            let menuFrame = CGRect(x: 50, y: view.bounds.height-110, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            firstMenuContainer.append(button)
            
            if i == 0 {
                // .identity : 단위행렬.
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap(_:)), for: .touchUpInside)
            }
            // 첫번째 버튼이 가장 앞으로 나오도록!
            view.bringSubview(toFront: firstMenuContainer.first!)
        }
    }
    
    @objc func firstMenuDidTap(_ button: UIButton) {
        // 버튼이 눌렸는지 안눌렸는지를 파악하기 위해서! 오... 대박 난 변수 새로 뒀는뎅
        button.isSelected = !button.isSelected
        
        UIView.animate(withDuration: Time.mid, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            [firstMenuContainer] in
            for (idx, menu) in firstMenuContainer.enumerated() {
                guard idx != 0 else { continue }
                if button.isSelected { // true
                    menu.transform = .identity // 원래 값 그대로. 뱉어낸다요
                    menu.frame.origin.y -= UI.distance * CGFloat(idx)
                } else {
                    menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale) // 음수로 하면 좌우/상하 반전
                    menu.frame.origin.y += UI.distance * CGFloat (idx)
                    
                    //                    menu.transform.translatedBy(x: <#T##CGFloat#>, y: <#T##CGFloat#>) // x, y 좌표로 이동
                    //                    menu.transform.rotated(by: .pi / 3) // 회전
                }
            }
        })
    }
    
    
    private func setupSecondMenu() {
        for i in 0..<UI.menuCount {
            let menuFrame = CGRect(x: 250, y: view.bounds.height-110, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            secondMenuContainer.append(button)
            
            if i == 0 {
                // .identity : 단위행렬.
                button.transform = .identity
                button.addTarget(self, action: #selector(secondMenuDidTap(_:)), for: .touchUpInside)
            }
            // 첫번째 버튼이 가장 앞으로 나오도록!
            view.bringSubview(toFront: secondMenuContainer.first!)
        }
    }
    
    @objc func secondMenuDidTap(_ button: UIButton) {
        button.isSelected = !button.isSelected
        
        UIView.animateKeyframes(withDuration: Time.mid, delay: 0, options: [.beginFromCurrentState], animations: {
            [secondMenuContainer] in
            var startTime = 0.0
            var duration = 1.0 / Double(UI.menuCount)
            
            for i in 1..<UI.menuCount {
                defer { startTime += duration }
                UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: duration, animations: {
                    if button.isSelected {
                        secondMenuContainer[i].transform = .identity
                        secondMenuContainer[i].transform = secondMenuContainer[i].transform.translatedBy(x: CGFloat(-30*i), y: 0)
                        
                        secondMenuContainer.enumerated()
                            .filter { return $0.offset >= i }
                            .forEach { $0.element.frame.origin.y -= UI.distance}
                    } else {
                        let minimumScaleTransform = CGAffineTransform.identity.scaledBy(x: UI.minScale, y: UI.minScale)
                        secondMenuContainer[UI.menuCount - i].transform = minimumScaleTransform
                        secondMenuContainer.enumerated()
                            .filter { return $0.offset >= UI.menuCount-1 }
                            .forEach { $0.element.frame.origin.y += UI.distance}
                    }
                })
            }
        })
    }
}
