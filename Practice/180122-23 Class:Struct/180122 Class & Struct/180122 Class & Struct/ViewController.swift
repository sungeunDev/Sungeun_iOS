//
//  ViewController.swift
//  180122 Class & Struct
//
//  Created by 박성은 on 2018. 1. 22..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cal: Calculator = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let mazingaZ = Person(name: "마징가Z", major: "고딩", gender: "남")
        let dicZ = ["국어":80, "수학":100, "슬생":50, "기술":100, "싸움":99]
        mazingaZ.setSubjects(subjectsDic: dicZ)
        
        let atom = Person(name: "아톰", major: "고딩", gender: "남")
        let dicAtom = ["수학":30, "과학":100, "국어":0, "분자":50, "수소":70, "산소":95, "싸움":85]
        atom.setSubjects(subjectsDic: dicAtom)
        
        let OGZ = Person(name: "오쥐지", major: "초딩", gender: "남")
        let dicOGZ = ["조우찬":90, "박현진":60, "에이칠로":70, "싸움":50, "수학":20, "국어":100]
        OGZ.setSubjects(subjectsDic: dicOGZ)
     
        cal.average(student: mazingaZ)
        cal.average(student: atom)
        cal.average(student: OGZ)
        
        cal.jjang(mazingaZ, atom, OGZ)
        cal.genius(stu1: atom, stu2: mazingaZ)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

