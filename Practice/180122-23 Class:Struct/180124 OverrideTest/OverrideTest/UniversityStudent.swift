//
//  UniversityStudent.swift
//  OverrideTest
//
//  Created by 박성은 on 2018. 1. 24..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class UniversiryStudent: Student
{
    override func eat() {
        print("먹는다. 학식")
    }
    
    var major: String
    func goMT()
    {
        print("간다. MT")
    }
    
    init(major: String) {
        
        self.major = major
        super.init(grade: "")
    }
    
}
