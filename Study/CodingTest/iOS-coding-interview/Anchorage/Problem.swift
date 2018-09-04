//
//  Problem.swift
//  Anchorage
//
//  Created by Joshua Park on 16/07/2018.
//  Copyright © 2018 Knowre. All rights reserved.
//

import Foundation

/**
 A representation of a problem.
 */
class Problem: Codable {
    
    // TODO: Keep a reference to the lesson it belongs to.
    
    /// The problem identifier.
    let id: Int
    
    /**
     The result of solving a problem.
     
     Result is one of:
        - `nil`: The problem has never been solved.
        - `true`: The user solved the problem correctly.
        - `false`: The user solved the problem incorrectly.
     */
    var result: Bool?
    
    init(id: Int) {
        self.id = id
    }
    
}
