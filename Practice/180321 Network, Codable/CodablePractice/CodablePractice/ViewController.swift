//
//  ViewController.swift
//  CodablePractice
//
//  Created by sungnni on 2018. 3. 21..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

  
    
}

struct AppleMusic: Codable {
    let feed: [Feed]
}

struct Feed: Codable {
    let title: String
    let updated: String
    let result: [Result]
    
}

struct Result: Codable {
    
}
