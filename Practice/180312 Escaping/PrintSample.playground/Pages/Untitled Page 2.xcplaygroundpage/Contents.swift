//: [Previous](@previous)

import Foundation

print(String(1))

struct Dog {
    let age = 1
}

let dog = Dog()
print(String(describing: dog))


struct Cat: LosslessStringConvertible {
    let age = 1
    let description: String
    init?(_ description: String) {
        self.description = description
    }
}

let cat = Cat("I'm a cat")!
print(String(cat))
