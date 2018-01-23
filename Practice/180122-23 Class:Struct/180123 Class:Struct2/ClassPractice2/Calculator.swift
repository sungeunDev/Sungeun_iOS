//
//  Calculator.swift
//  ClassPractice2
//
//  Created by 박성은 on 2018. 1. 23..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class Calculator
{
    //1. 평균
    //2. power
    //3. 수학점수
    
    func average(person: Person)
    {
        var sum = 0
        for sub in person.subjects
            {
                sum += sub.score
            }
        print(person.name, " : ", Double(sum)/Double(person.subjects.count))
    }
    
    func power(input: Person...)
    {
        var zzangName = ""
        var zzangPower = 0
        for person in input
        {
           if zzangPower < person.getPower()
           {
            zzangPower = person.getPower()
            zzangName = person.name
            }
        }
        print("\(zzangName)이 파워가 \(zzangPower)점으로 짱입니다.")
    }
    
    func genious(stu1: Person, stu2: Person)
    {
        let stu1IQ = stu1.genius()
        let stu2IQ = stu2.genius()
        
        var diffScore = 0
        var genius = ""
        
        if stu1IQ > stu2IQ
        {
            diffScore = stu1IQ - stu2IQ
            genius = stu1.name
        }
        else
        {
            diffScore = stu2IQ - stu1IQ
            genius = stu2.name
        }
        print("수학 천재는 \(genius)입니다. \(diffScore)점 차이")
    }
    
    
}
