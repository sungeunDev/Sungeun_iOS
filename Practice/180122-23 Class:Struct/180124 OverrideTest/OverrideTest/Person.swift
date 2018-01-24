//
//  Person.swift
//  OverrideTest
//
//  Created by 박성은 on 2018. 1. 24..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class Person
{
    var name: String
    var age: Int
    func eat()
    {
        print("먹는다. 집밥")
    }
    
    init(name: String, age:Int ) {
        self.name = name
        self.age = age
    }
    
    
    convenience init(name:String) {
        self.init(name: "", age: 0)
    }
}
