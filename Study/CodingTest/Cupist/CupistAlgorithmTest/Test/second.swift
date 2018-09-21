//
//  second.swift
//  Test
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

struct Point {
    let x: Int
    let y: Int
    
    init(of point: String) {
        let pointArray = point.characters.split(separator: " ").map { String($0) }
        self.x = Int(pointArray[0])!
        self.y = Int(pointArray[1])!
    }
}


//var probs: [String] = []
//for _ in 1...4 {
//    probs.append(readLine()!)
//}

func secondProblem(of points: [String]) -> Int {
    var p = Point(of: points[0])
    var q = Point(of: points[1])
    var r = Point(of: points[2])
    var s = Point(of: points[3])

    // 무조건 p가 q의 왼쪽에, r이 s의 왼쪽에 위치
    if p.x > q.x {
        let temp = p
        p = q
        q = temp
    }
    if r.x > s.x {
        let temp = r
        r = s
        s = temp
    }
    
    // 첫번째 사각형이 두번째 사각형의 왼쪽에 위치하도록 좌표 배치 후 면적 구함
    if q.x <= s.x {
        if r.x < p.x {
            print("\n---------- [ RS가 PQ를 포함 ] -----------\n")
            return includeArea(points: [p, q])
        }
        print("\n---------- [ p, q, r, s ] -----------\n")
        return crossArea(p: p, q: q, r: r, s: s)
    } else {
        if p.x < r.x {
            return includeArea(points: [r, s])
        }
        print("\n---------- [ r, s, p, q ] -----------\n")
        return crossArea(p: r, q: s, r: p, s: q)
    }
}

func includeArea(points: [Point]) -> Int {
    let first = points[0]
    let second = points[1]
    return abs(first.x - second.x) * abs(first.y - second.y)
}

func crossArea(p: Point, q: Point, r: Point, s: Point) -> Int {
    let x = q.x
    var y = r.y
    if r.y < s.y {
        y = s.y // R, S 비교
    }
    
    let width = x - r.x
    var height = y - p.y
    if q.y < p.y {
        height = y - q.y
    }

    print("\n---------- [ x/y  ] -----------\n")
    print(x, y)
    
    print("\n---------- [ width / height ] -----------\n")
    print(width, height)
    return width * height
}



