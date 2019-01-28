//
//  GorillaDB.swift
//  AsyncUnitTest
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import Foundation

class GorillaDB {
    
    var db: Dictionary<String, Banana> = [:]
    
    func save(banana: Banana, key: String) {
        db.updateValue(banana, forKey: key)
    }
    
    func load(key: String) -> Banana? {
        return db[key]
    }
    
    var size: Int {
        return db.count
    }
}
