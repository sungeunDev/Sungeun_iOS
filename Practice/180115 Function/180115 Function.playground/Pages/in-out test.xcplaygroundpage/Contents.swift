//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


var firstNum: Int = 10
var secondNum: Int = 30

func swap(_ a: inout Int, _ b:inout Int)
{
    let temporaryA = a
     a = b
     b = temporaryA

}

print(firstNum, secondNum)
swap(&firstNum, &secondNum)
print(firstNum, secondNum)

// in-out 쓰는 이유 ?
// >> 간접적인 접근/범용적으로 사용 가능. 매개변수를 쓰기 때문. 비귀속!
// 직접적으로 쓸 경우, 매번 함수를 만들어서 적용해줘야 함.
// 변수의 "주소값"을 가져오는 것.



