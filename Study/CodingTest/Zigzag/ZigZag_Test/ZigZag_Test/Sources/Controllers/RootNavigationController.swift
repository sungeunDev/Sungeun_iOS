//
//  RootNavigationController.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 4..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {
  override func viewDidLoad() {
    self.setNeedsStatusBarAppearanceUpdate()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
}
