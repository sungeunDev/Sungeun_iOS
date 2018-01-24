//
//  ViewController.swift
//  OverrideTest
//
//  Created by 박성은 on 2018. 1. 24..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sungeun: Person = Person(name: "박성은")
        sungeun.age = 27
        print(sungeun.eat())
        
        let pyl: Student = Student(grade: "B")
        print(pyl.eat())
        
        let starbucks: UniversiryStudent = UniversiryStudent(major: "커피")
        print(starbucks.eat())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

