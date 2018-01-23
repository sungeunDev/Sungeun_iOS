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
    
    func average(student: Person)
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
    func jjang(_ student: Person...)
    {
        var jjangName: String = ""
        var maxPower: Int = 0
        
        for person in student
        {
            var comparePower = person.getPower()
            //과목들 중에서 싸움을 찾아서 파워를 가져오기.
            
            if maxPower < comparePower
            {
                maxPower = comparePower
                
            }
        }
        
        //멘붕 @.@..................... 어려웡 힝... ㅠ.ㅠ T.T t.t Q.Q 어려웡!!!!
        //어려오.............................................
        
//        print("짱은 \()입니다.")
    }
    
    //        고딩 둘 중 수학 점수가 높은 아이는?
    func genius(stu1: Person, stu2: Person)
    {

        let stu1IQ: Int = stu1.getIQ()
        let stu2IQ: Int = stu2.getIQ()
        
        // geniusPerson에 지금은 값이 없기 때문에 "?" : 옵셔널
        var geniusPerson: Person?
        var diffScore = 0
        
        if stu1IQ > stu2IQ
        {
            geniusPerson = stu1
            diffScore = stu1IQ - stu2IQ
        } else
        {
            geniusPerson = stu2
            diffScore = stu2IQ - stu1IQ
        }
        
        print("\(geniusPerson!.name)의 수학점수가 \(diffScore)점 더 높습니다.")
    }
    
    
    
    
    
}
