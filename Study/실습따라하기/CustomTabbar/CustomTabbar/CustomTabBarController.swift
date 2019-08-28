//
//  CustomTabBarController.swift
//  CustomTabbar
//
//  Created by Sungeun Park on 20/05/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var secondVC: SecondViewController?
    var isFoldered = false {
        didSet {
            if isFoldered {
                foldSecondVC()
            } else {
                openSecondVC()
            }
        }
    }
    
    var thirdVC: SecondViewController?
    
    var currentVC: SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
    }
    
    func addSecondVC() {
        self.secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController

        self.addChild(secondVC!)
        
//        if currentVC == nil {
            view.insertSubview(secondVC!.view, at: 1)
//        } else {
//            UIView.transition(with: self.view, duration: 0.8, options: [.transitionFlipFromRight], animations: {
//                self.view.insertSubview(self.secondVC!.view, at: 1)
//            }, completion: nil)
//        }
        secondVC!.backgroundView.backgroundColor = .blue
        currentVC = secondVC
        
        thirdVC?.removeFromParent()
        thirdVC?.view.removeFromSuperview()
    }
    
    func addThirdVC() {
        self.thirdVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
     
        self.addChild(thirdVC!)
        
//        if currentVC == nil {
            view.insertSubview(thirdVC!.view, at: 1)
//        } else {
//            UIView.transition(with: self.view, duration: 0.8, options: [.transitionFlipFromRight], animations: {
//                self.view.insertSubview(self.thirdVC!.view, at: 1)
//            }, completion: nil)
//        }
        
        thirdVC!.backgroundView.backgroundColor = .yellow
        currentVC = thirdVC
        
        secondVC?.removeFromParent()
        secondVC?.view.removeFromSuperview()
    }
    
    public func addPlayerVC() {
        if currentVC == secondVC {
            addThirdVC()
        } else {
            addSecondVC()
        }
    }
    
    func openSecondVC() {
        guard let currentVC = currentVC else { return }
        
        setTabBarHidden(true, animated: true)
        UIView.animate(withDuration: 0.5, animations: {
            currentVC.view.frame.origin.y = 0
            currentVC.backgroundView.alpha = 1
            currentVC.miniSizeView.alpha = 0
        }, completion: nil)
    }
    
    func foldSecondVC() {
        let headerHeight = 100 + tabBar.frame.height
        setTabBarHidden(false, animated: true)
        
        guard let currentVC = currentVC else { return }
        UIView.animate(withDuration: 0.8, animations: {
            currentVC.view.frame.origin.y = self.view.frame.height - headerHeight
            currentVC.backgroundView.alpha = 0
            currentVC.miniSizeView.alpha = 1
        })
    }
    
    func foldSecondVCMiddleWay() {
        let headerHeight = 100 + tabBar.frame.height
        setTabBarHidden(false, animated: true)
        
        guard let currentVC = currentVC else { return }
        UIView.animate(withDuration: 0.8, animations: {
            currentVC.view.frame.origin.y = self.view.frame.height - headerHeight
            currentVC.miniSizeView.alpha = 1
        })
    }
    
    func selectColor(_ color: UIColor) {
        if let currentVC = currentVC {
            currentVC.selectedColor = color
            openSecondVC()
        }
    }
}

extension UITabBarController {
    func setTabBarHidden(_ isHidden: Bool, animated: Bool, completion: (() -> Void)? = nil ) {
        if (tabBar.isHidden == isHidden) {
            completion?()
        }
        
        if !isHidden {
            tabBar.isHidden = false
        }
        
        let height = tabBar.frame.size.height
        let offsetY = view.frame.height - (isHidden ? 0 : height)
        let duration = (animated ? 0.25 : 0.0)
        
        let frame = CGRect(origin: CGPoint(x: tabBar.frame.minX, y: offsetY), size: tabBar.frame.size)
        UIView.animate(withDuration: duration, animations: {
            self.tabBar.frame = frame
        }) { _ in
            self.tabBar.isHidden = isHidden
            completion?()
        }
    }
}
