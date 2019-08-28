//
//  main.swift
//  Test
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

//print(first())
//print(test())

let input = readLine()!.components(separatedBy: " ")
let row = Int(input[0])!
let column = Int(input[1])!
print("test")
print(printPretty(of: cleanerVisitCount(row: row, column: column)))

//var probs: [String] = []
//for _ in 1...4 {
//    probs.append(readLine()!)
//}
//print(secondProblem(of: probs))
