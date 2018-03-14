//: [Previous](@previous)

import Foundation

// str을 받아서 문자열 갯수를 반환하는 함수
func param(str : String) -> Int {
    return str.count
}

// 여기에서 param은 클로저
// 함수 안의 함수 - 중첩 함수
func performClosure(param2: (String) -> Int) {
    
    // param 안에 문자열 swift를 넣었고,
    // param("Swift")의 반환 값(Int)인 5를 print
    
    print(param2("Swift"))
}

// 함수 vs. Closure
// 함수는 내부 작동은 건들 수 없고, 인자 값을 넣는 것만 가능
print(param(str: "Swift"))

// 반환값만 Int라면 인자(String)를 받아서 뭘 해도 됨.
performClosure { $0.count }
performClosure { $0.count * $0.count }
