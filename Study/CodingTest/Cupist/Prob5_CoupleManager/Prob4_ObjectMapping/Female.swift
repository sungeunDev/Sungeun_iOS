//
//  Female.swift
//  Prob4_ObjectMapping
//
//  Created by sungnni on 2018. 9. 13..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

class Female: Codable, PersonProtocol {
    var info: Person
    
    required init(from decoder: Decoder) throws {
        info = try decoder.singleValueContainer().decode(Person.self)
    }
}
