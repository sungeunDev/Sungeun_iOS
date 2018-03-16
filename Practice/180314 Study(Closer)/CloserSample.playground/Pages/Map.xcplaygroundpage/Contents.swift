//: [Previous](@previous)

import Foundation

let num = [1, 2, 3, 4, 5]

let starList = num.map { (num: Int) -> String in
    var star = ""
    for _ in 0..<num {
        star += "*"
    }
    return star
}

print(starList)

// apple document example
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

// map의 받는 인자는 1개라서 후행클로저로 인자명 생략
let string = numbers.map { (num) -> String in
    var output = ""
    var numTemp = num
    while numTemp > 0 {
        output = digitNames[numTemp%10]! + output
        numTemp /= 10
    }
    return output
}

print(string)
// ["OneSix", "FiveEight", "FiveOneZero"]
