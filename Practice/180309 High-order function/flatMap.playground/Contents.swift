//: Playground - noun: a place where people can play

import UIKit

let array = ["1j", "2d", "22", "33"]

let m1 = array.map({ Int($0) })
let f1 = array.flatMap({ Int($0) })
print(m1, "\n", f1)

let m2 = array.map({ Int($0) }).first
let f2 = array.flatMap({ Int($0) }).first
print(m2, "\n", f2)
