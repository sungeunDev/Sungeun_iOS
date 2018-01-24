//
//  Student.swift
//  OverrideTest
//
//  Created by 박성은 on 2018. 1. 24..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class Student: Person
{
    var grade: String = ""
    func study()
        {
            print("학생의 본분은 공부이다. 그래서 내 학점은.. \(grade)")
    }
    
    init(grade: String)
    {
        self.grade = grade
        super.init(name: "", age: 0)
    }
    
    override func eat() {
        print("먹는다. 급식")
    }
}
