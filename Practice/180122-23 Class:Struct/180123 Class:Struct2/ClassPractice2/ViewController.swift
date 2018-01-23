//
//  ViewController.swift
//  ClassPractice2
//
//  Created by 박성은 on 2018. 1. 23..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cal: Calculator = Calculator()
        
        let p1 : Person = Person(name: "박성은", major: "도시공학과", gender: "여")
        p1.subjectAdd(input: ["수학":100, "과학":90, "영어":76, "싸움":80])
        
        let p2 : Person = Person(name: "조씨", major: "조경학과", gender: "남")
        p2.subjectAdd(input: ["수학":70, "과학":64, "영어":13, "국어":20, "싸움":30])
        
        let p3 : Person = Person(name: "이씨", major: "농대", gender: "남")
        p3.subjectAdd(input: ["수학":25, "과학":42, "영어":54, "농사":100, "싸움":60])
        
        
        cal.average(person: p1)
        cal.average(person: p2)
        cal.average(person: p3)
        
        cal.power(input: p1, p2, p3)
        cal.genious(stu1: p1, stu2: p2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

