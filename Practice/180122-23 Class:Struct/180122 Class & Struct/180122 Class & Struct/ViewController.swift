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
    
        let mazingaZ = Student(major: 2, name: "마징가Z")
        let dicZ = ["국어":80, "수학":100, "슬생":50, "기술":100, "싸움":99]
//        mazingaZ.setSubjects(subjectsDic: dicZ)
        
        let atom = Student(major: 3, name: "아톰")
        let dicAtom = ["수학":30, "과학":100, "국어":0, "분자":50, "수소":70, "산소":95, "싸움":85]
//        atom.setSubjects(subjectsDic: dicAtom)
        
        let OGZ = Student(major: 1, name: "오쥐지")
        let dicOGZ = ["조우찬":90, "박현진":60, "에이칠로":70, "싸움":50, "수학":20, "국어":100]
//        OGZ.setSubjects(subjectsDic: dicOGZ)
     
        cal.average(student: mazingaZ)
        cal.average(student: atom)
        cal.average(student: OGZ)
        
        cal.jjang(mazingaZ, atom, OGZ)
//        cal.genius(stu1: atom, stu2: mazingaZ)
        
        
        let teacher = Worker(name: "김선생", gender: "남", job: "선생님", salary: 100, isSaveMoney: true, saveMonth: 12)
        
        
//        let godSu = Worker(name: "박갓수", gender: "여", job: "취준생", salary: 5, isSaveMoney: false, saveMonth: nil)
        
        let developer = Worker(name: "이개발", gender: "남", job: "개발자", salary: 600, isSaveMoney: true, saveMonth: 9)

        let cook = Worker(name: "조주부", gender: "남", job: "요리사", salary: 350, isSaveMoney: true, saveMonth: 6)
        
       // cal.savedMoney(worker: godSu)
//        cal.savedMoney(worker: cook)
//        cal.savedMoney(worker: teacher)
//        cal.savedMoney(worker: developer)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

