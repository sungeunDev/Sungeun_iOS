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




