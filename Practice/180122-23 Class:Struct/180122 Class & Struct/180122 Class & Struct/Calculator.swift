//
//  Calculator.swift
//  180122 Class & Struct
//
//  Created by 박성은 on 2018. 1. 22..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class Calculator {
    
    //        각 평균 구하기
    
    func average(student: Student)
    {
        var sum = 0
        // for (sub, score) in student.subjects >> subjects는 dic형태가 아직 아니기 때문에 불러올 수 없음.
        for subject in student.subjects
        {
            sum += subject.score
        }
        let average = Double(sum) / Double(student.subjects.count)
        print("\(student.name)의 전공은 \(student.major)이고, 평균은 \(average)입니다.")
    }

    // 가장 싸움을 잘 하는 아이는?
    // Person... >> 파라미터를 복수개로 받을 수 있음. ',(콤마)'로 여러개!
    
    func jjang(_ student: Student...)
    {
        var jjang: Student?
        for student in student {
            if let jjangTemp = jjang
            {
//                if student.mathScore != nil
//                {
                    if jjangTemp.getPower() < student.getPower()
                    {
                        jjang = student
                    }
                    else
                    {
                        print("jjang은 없음.")
                    }
                }
            }
                print(jjang!.name)
        }


    
    //        고딩 둘 중 수학 점수가 높은 아이는?
    func genius(stu1: Student, stu2: Student)
    {
        if let stu1Math = stu1.mathScore, let stu2Math = stu2.mathScore
        {
            if stu1Math > stu2Math
            {
               print(stu1.name)
            } else
            {
               print(stu2.name)
            }
        }
    }

