//
//  Banana.swift
//  AsyncUnitTest
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import Foundation

public class Banana: Equatable {
    public static func == (lhs: Banana, rhs: Banana) -> Bool {
        return lhs.id == rhs.id
    }
    
    private var id: Int {
        return Int.random(in: 1...1000)
    }
    
    private var isPeeled = false
    
    public func peel() {
        isPeeled = true
    }
    
    public var isEdible: Bool {
        return isPeeled
    }
}
