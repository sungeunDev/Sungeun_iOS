//
//  first.swift
//  Test
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

func first() -> String {
    let probArray = readLine()!.components(separatedBy: " ")
    let firstName = probArray[0].capitalized
    let lastName = probArray[1].capitalized
    
    return ("\(firstName) \(lastName)")
}

// Logic
func calemCase(of str: String) -> String {
    let strArray = str.components(separatedBy: " ")
    let firstName = strArray[0]
    //    let lastName = strArray[1].capitalized
    
    //    firstName.index(after: firstName.startIndex)
    //    firstName.endIndex
    let str = firstName
    let c = String(firstName[firstName.index(firstName.startIndex, offsetBy: 1)...firstName.index(firstName.startIndex, offsetBy: 4)]).lowercased()
    
    print(c)
    return ("\(firstName)")
}

// Main
//let probCount = Int(readLine()!)!
//for caseNum in 1...probCount {
//    let probStr = readLine()!
//    print("Case #\(caseNum)")
//    print(calemCase(of: probStr))
//}
