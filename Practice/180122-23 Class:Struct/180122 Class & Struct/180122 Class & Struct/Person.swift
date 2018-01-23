//
//  Person.swift
//  180122 Class & Struct
//
//  Created by 박성은 on 2018. 1. 22..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class Person {
 
    var name: String
    var major: String
    var gender: String
    
    var subjects: [Subject] = []
    
    init(name: String, major: String, gender: String) {
        self.name = name
        self.major = major
        self.gender = gender
    }
    
    // 한개씩 받기
    func addSubject(name: String, score: Int)
    {
        subjects.append(Subject(name: name, score: score))
    }
    
    // 과목 : 점수 를 한꺼번에 받기(딕셔너리)
    func setSubjects(subjectsDic: [String:Int])
    {
        for (subName, subScore) in subjectsDic
        {
            addSubject(name: subName, score: subScore)
        }
    }
    
    
    func getIQ() -> Int
    {
        for subject in subjects
        {
            if subject.name == "수학"
            {
                return subject.score
            }
        }
        return 0
    }
    
    func getPower() -> Int
    {
        for subject in subjects
        {
            if subject.name == "싸움"
            {
                return subject.score
            }
        }
        return 0
    }
    
}

