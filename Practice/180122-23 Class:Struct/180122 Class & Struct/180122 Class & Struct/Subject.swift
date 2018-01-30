//
//  Subject.swift
//  180122 Class & Struct
//
//  Created by 박성은 on 2018. 1. 22..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

struct Subject {
  
    var name: String
    var isHasGrade: Bool
    
    var score: Int
    var grade: String? {
        if isHasGrade
        {
            switch score {
            case 80...100:
                return "A"
            case 60..<80:
                return "B"
            case 40..<60:
                return "C"
            default:
                return "F"
            }
        }
        else
        {
            return nil
        }
    }
    
    init(name: String, score: Int, isHasGrade: Bool) {
        self.name = name
        self.score = score
        self.isHasGrade = isHasGrade
    }
    
//    func scoreToGrade(_ score: Int) -> String
//    {
//        var grade = ""
//        switch score {
//        case 80...100:
//            grade = "A"
//        case 60..<80:
//            grade = "B"
//        case 40..<60:
//            grade = "C"
//        default:
//            grade = "D"
//        }
//        return grade
//    }

    // var grade: String?
    // 과목은 grade가 존재할 수 있지만, 모든 학생들이 존재하는 것은 아님.
    
    // 둘 다 필요하니까 memberwise
    // 바꿀 수 없게 하려면 앞에 private var 해줘야 하지만 일단 생략
}
