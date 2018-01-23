//
//  Person.swift
//  ClassPractice2
//
//  Created by 박성은 on 2018. 1. 23..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class Person
{
    var name:String
    var major:String
    var gender:String
    
    var subjects: [Subject] = []
    // 배열안에 들어가는게 Int형이냐 Subject냐의 차이. 구조 똑같음.
    // var list: [Int] = []
    
    init(name:String, major:String, gender:String) {
        self.name = name
        self.major = major
        self.gender = gender
    }
    
    func subjectAddOne(name:String, score:Int)
    {
        subjects.append(Subject(subName: name, score: score))
    }
    
    
    func subjectAdd(dic: [String:Int])
    {
        for (subName, score) in dic
        {
            //subjects.append(30): 리터럴 = subjects.append(Int(30)) 같은 구조!!
            //인스턴스를 만들어서 subjects에 추가
            //인스턴스 만드는 건 다 똑같!! >> ClassName( 생성자 )
            //initialize를 지정하지 않으면 생성자에 property name뜸. Subject의 경우 memberwise에 의해 자동으로 생성.
            subjects.append(Subject(subName: subName, score: score))
        }
    }
    
    func getPower() -> Int
    {
        for sub in subjects
        {
            if sub.subName == "싸움"
            {
                return sub.score
            }
        }
        return 0
    }
    
    
    func genius() -> Int
    {
        for sub in subjects
        {
            if sub.subName == "수학"
            {
                return sub.score
            }
        }
        return 0
    }
}
