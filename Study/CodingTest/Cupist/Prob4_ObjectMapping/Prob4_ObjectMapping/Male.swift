//
//  Male.swift
//  Prob4_ObjectMapping
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

class Male: Codable {
    var info: Person
    var isFulfilled: Bool
    
    enum CodingKeys: String, CodingKey {
        case info
        case isFulfilled = "is_fulfilled"
    }
    
    required init(from decoder: Decoder) throws {
        info = try decoder.singleValueContainer().decode(Person.self)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isFulfilled = try values.decode(Bool.self, forKey: .isFulfilled)
    }
    
    // MARK: - public
    public func validate() -> Bool {
        if info.validate() {
            return true
        } else {
            return false
        }
    }
    
}
