//
//  ViewController.swift
//  SubscriptionSample
//
//  Created by 박성은 on 2018. 3. 2..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0,0] = 1
        
        print(746381295[0])
        print(746381295[1])
        print(746381295[2])
        print(746381295[8])
        
        var stack = Stack<Int>()
        stack.push(4)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// subscrip Sample
struct Matrix {
    private let rows: Int
    private let columns: Int
    private var grid: [Double]
    init(rows: Int, columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating:0.0, count: rows * columns)
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            return grid[row*columns + column]
        }
        set {
            grid[row*columns + column] = newValue
        }
    }
}

// extension Sample
extension Int {
    subscript(digitIndex: Int) -> Int {
    
        var num: Int = self
        for _ in 0..<digitIndex {
            num /= 10
        }
        return num % 10
    }
}


// generic Sample
struct Stack<T> {
    var stackTemp: [T] = []
    mutating func push(_ data: T) {
        stackTemp.append(data)
    }
    mutating func pop() -> T {
        return stackTemp.popLast()!
    }
}
