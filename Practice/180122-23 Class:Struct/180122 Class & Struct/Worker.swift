//
//  Worker.swift
//  180122 Class & Struct
//
//  Created by 박성은 on 2018. 1. 25..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

class Worker: Person
{
    var job: String
    var salary: Int

    var isSaveMoney: Bool = false
    var saveMonth: Int?
    
    init(name: String, gender: String, job: String, salary: Int, isSaveMoney: Bool, saveMonth: Int?)
    {
        self.job = job
        self.salary = salary
        self.isSaveMoney = isSaveMoney
        
        if isSaveMoney != nil
        {
            let saveMoney = (salary, saveMonth)
        }
        super.init(name: name, gender: gender)
    }
}

