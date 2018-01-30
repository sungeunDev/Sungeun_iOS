//
//  Property.swift
//  Property
//
//  Created by 박성은 on 2018. 1. 26..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

// struct는 관련된 것들이면 한 파일에 쓰기도.
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y:centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}

class RecInfo {
    
    var origin: Point = Point()
    var size: Size = Size()
    
    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
    
}

class Calculator {
    
    func center(input: Rect) -> Point {
    
        return input.center
    }
}
