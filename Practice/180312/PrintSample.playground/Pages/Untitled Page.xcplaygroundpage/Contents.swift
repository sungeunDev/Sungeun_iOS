//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)
debugPrint(str)
dump(str)

final class Person {
    let name = "홍길동"
    let age = 20
}

let person = Person()

print(person)
debugPrint(person)
dump(person)

let lb = UILabel()
lb.text = str
print(lb)


extension Person: CustomDebugStringConvertible {
    
    var debugDescription: String {
        return "myDebugDescription"
    }
}

print(person)
debugPrint(person)
dump(person)

print(person.debugDescription)

struct Person2: LosslessStringConvertible {
    let description: String
    init?(_ description: String){
        self.description = description
    }
}

let person2 = Person2("I'm a Person2")
print(String(describing: person2))



