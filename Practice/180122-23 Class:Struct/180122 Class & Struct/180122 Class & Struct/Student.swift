//
//  Student.swift
//  180122 Class & Struct
//
//  Created by 박성은 on 2018. 1. 25..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class Student: Person
{
    //대학교 3, 고딩2, 초딩1, 유치원0
    var major: Int
    var isUnivStu: Bool = false
    
    var subjectsDic: [String:Int] = [:]
    var subjects: [Subject] {
        get{
            var returnresult: [Subject] = []
            for (name, score) in subjectsDic
            {
                returnresult.append(Subject(name: name, score: score, isHasGrade: false))
            }
            return returnresult
        }
        set(subjectArray){
            subjectsDic = [:]
            for subject in subjectArray
            {
                subjectsDic.updateValue(subject.score, forKey: subject.name)
            }
        }
    }
    
    var mathScore: Int? {
            for subject in subjects
            {
                if subject.name == "수학"
                {
                    return subject.score
                }
            }
            return nil
            }
    
    init(major: Int, name: String)
    {
        self.major = major
//        self.subjects = []
        if major == 3 {
            self.isUnivStu = true
        }
        super.init(name: name, gender: "")
    }
    
    // 한개씩 받기
    func addSubject(name: String, score: Int, isUnivStu: Bool)
    {
//        subjects 는 이제 "저장" 프로퍼티가 아니고, "연산" 프로퍼티이기 때문에 append를 할 수 없음.
//        subjects.append(Subject(name: name, score: score, isHasGrade: isUnivStu))
        subjectsDic.updateValue(score, forKey: name)
    }
    
    // 과목 : 점수 를 한꺼번에 받기(딕셔너리)
    func setSubjects(subjectDic: [String:Int])
    {
        for (subName, subScore) in subjectDic
        {
//            addSubject(name: subName, score: subScore, isUnivStu: isUnivStu)
            subjectsDic.updateValue(subScore, forKey: subName)
        }
    }

//    func getIQ() -> Int
//    {
////        guard let subjects = subjects else { return 0 }
//
//        for subject in subjects
//        {
//            if subject.name == "수학"
//            {
//                return subject.score
//            }
//        }
//        return 0
//    }
    
    func getPower() -> Int
    {
//        guard let subjects = subjects else { return 0 }
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
