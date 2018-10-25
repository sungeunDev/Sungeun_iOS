//
//  ViewController.swift
//  LayerShadowSample
//
//  Created by Ari on 25/10/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var first: UIView!
    @IBOutlet weak var second: UIView!
    @IBOutlet weak var third: UIView!
    @IBOutlet weak var fiurth: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        first.setShadow(offset: CGSize.zero, opacity: 1, radius: 0)
        second.setShadow(offset: CGSize.zero, opacity: 1, radius: 5)
        third.setShadow(offset: CGSize(width: 0, height: 2), opacity: 0.5, radius: 4)
        fiurth.setShadow(offset: CGSize(width: 0, height: 10), opacity: 1, radius: 10)
    }


}


extension UIView {
    
    
    func setShadow(offset: CGSize, opacity: Float, radius: CGFloat) {
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
    }
    
}
