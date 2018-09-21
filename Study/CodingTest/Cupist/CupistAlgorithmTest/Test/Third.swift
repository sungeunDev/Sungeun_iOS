//
//  Third.swift
//  Test
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

// 로봇스



func cleanerVisitCount(row: Int, column: Int) -> [[Int]] {
    var direction = 0 // 0 - 동, 1 - 북, 2 - 서, 3 - 남
    
    let total = row * column
    let columArray = Array(repeating: 0, count: column)
    var returnResult: [[Int]] = Array(repeating: columArray, count: row)
    
    var rowIndex = 0
    var columnIndex = 0
    var index = 1
    var cycle = 0
    
    while index <= total {
        switch direction {
        case 0:
            if columnIndex < column - cycle {
                returnResult[rowIndex][columnIndex] = index
                columnIndex += 1
                index += 1
            } else {
                direction += 1
                rowIndex += 1
                columnIndex -= 1
            }
        case 1:
            if rowIndex < row - cycle {
                returnResult[rowIndex][columnIndex] = index
                rowIndex += 1
                index += 1
            } else {
                direction += 1
                columnIndex -= 1
                rowIndex -= 1
            }
        case 2:
            if columnIndex >= cycle {
                returnResult[rowIndex][columnIndex] = index
                columnIndex -= 1
                index += 1
            } else {
                direction += 1
                rowIndex -= 1
                columnIndex += 1
            }
        case 3:
            if rowIndex > cycle {
                returnResult[rowIndex][columnIndex] = index
                rowIndex -= 1
                index += 1
            } else {
                direction = 0
                columnIndex += 1
                rowIndex += 1
                cycle += 1
            }
        default:
            print("wrong direction")
        }
    }
    return returnResult
}

func printPretty(of lists: [[Int]]) -> String {
    return lists.reduce("") { (result, columns) -> String in
        let row = columns.reduce("", { (result, column) -> String in
            return "\(result)\(column) "
        })
        return "\(result)\(row)\n"
    }
}
