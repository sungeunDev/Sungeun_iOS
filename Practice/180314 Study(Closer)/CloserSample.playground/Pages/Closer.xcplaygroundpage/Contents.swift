//: Playground - noun: a place where people can play

import UIKit

//-------------------------------<< 클로저 >>-----------------------------------
let add: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

let divide: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a / b
}

func calculate(a: Int, b:Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

print(calculate(a: 10, b: 10, method: add))


// add 기능의 method를 바로 클로저로 대입
var calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left + right
})

print(calculated)


// 기본표현을 축약형으로 바꿔보기

// method name 생략
calculated = calculate(a: 50, b: 10, {(left: Int, right: Int) -> Int in
    return left + right
})

// 반환타입 생략
calculated = calculate(a: 50, b: 10, {(left: Int, right: Int) in
    return left + right
})

// property name 생략
calculated = calculate(a: 50, b: 10) {
    return $0 + $1
}

// 반환 키워드 생략
calculated = calculate(a: 50, b: 10) {$0 + $1}

//-------------------------------<< 클로저 >>-----------------------------------

