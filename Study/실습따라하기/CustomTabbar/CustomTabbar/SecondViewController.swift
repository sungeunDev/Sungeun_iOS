//
//  SecondViewController.swift
//  CustomTabbar
//
//  Created by Sungeun Park on 20/05/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var embededView: UIView!
    @IBOutlet weak var miniSizeView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    var customTabbarController: CustomTabBarController! {
        get {
            return (self.tabBarController as! CustomTabBarController)
        }
    }
    
    var selectedColor: UIColor? {
        didSet {
            backgroundView.backgroundColor = selectedColor
        }
    }
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        embededView.backgroundColor = .white

        dismissButton.addTarget(self, action: #selector(dismissSecondVC), for: .touchUpInside)
        
        backgroundView.alpha = 1
        miniSizeView.alpha = 0
        
        customTabbarController.setTabBarHidden(true, animated: true)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.embededView.frame.origin.x -= self.view.frame.width
//            self.backgroundView.alpha = 1
        }, completion: nil)
        
        panGestureRecognizer.addTarget(self, action: #selector(pangestureRecognizer(_:)))
        tapGestureRecognizer.addTarget(self, action: #selector(tapGestureRecognizer(_:)))
    }
    
    @objc func tapGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        customTabbarController.openSecondVC()
    }
    
    @objc func pangestureRecognizer(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: embededView)
        
        guard let currentVC = customTabbarController.currentVC else { return }
        
        currentVC.view.frame.origin.y += translation.y

        let customView = currentVC.view.frame.origin
        let halfHeight = customTabbarController.view.frame.height * 0.4
        var isDismissView = false
        
        if customView.y > halfHeight {
            isDismissView = true
        } else {
            isDismissView = false
        }
        
        switch sender.state {
        case .changed:
            sender.setTranslation(CGPoint.zero, in: currentVC.view)
            
            let ratio = customView.y / customTabbarController.view.frame.height
            self.miniSizeView.alpha = ratio
            self.backgroundView.alpha = 1
            
        case .ended:
            if isDismissView {
                customTabbarController.foldSecondVCMiddleWay()
            } else {
                customTabbarController.openSecondVC()
            }
        default:
            break
        }
    }
    
    @objc func dismissSecondVC() {
        customTabbarController.isFoldered = true
    }
    
    @IBAction func closeButton() {
        cloaseBtn()
    }
    
    private func cloaseBtn() {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
    @IBAction func addThirdView() {
        customTabbarController.addPlayerVC()
    }
}
