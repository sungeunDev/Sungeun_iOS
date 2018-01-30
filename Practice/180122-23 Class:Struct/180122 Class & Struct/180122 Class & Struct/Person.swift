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
    var gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender

        //어차피 초기화 할거라면 아예 옵셔널로 지정하지 않는게 더 좋을 수도 있음.
        //선언할 때 초기화!
        //언제, 어디서, 무엇에 어떤 옵셔널을 쓸지가 관건.
    }
}
