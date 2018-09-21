//
//  Lesson.swift
//  Anchorage
//
//  Created by Joshua Park on 16/07/2018.
//  Copyright © 2018 Knowre. All rights reserved.
//

import Foundation

/**
 A light wrapper encapsulating the lesson identifier and
 problems that make up the lesson.
 */
class Lesson: Codable {
    
    /// The lesson identifier.
    let id: Int
    
    /**
     The list of problems.
     */
    var problems = [Problem]()
    
    init(id: Int) {
        self.id = id
    }
    
}
