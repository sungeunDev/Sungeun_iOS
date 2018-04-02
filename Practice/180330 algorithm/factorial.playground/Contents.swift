//: Playground - noun: a place where people can play

import UIKit

func factorial(num: Int) {
    var result = 1
    for i in stride(from: 1, through: num, by: 1) {
        result *= i
    }
    print(result)
}

factorial(num: 5)

// 재귀
func jaegjae(num: Int) -> Int {

    if num != 1 {
        return jaegjae(num: num - 1) * num
    } else {
        return 1
    }
}

print(jaegjae(num: 5))


func pibonachi(index: Int) -> Int {
    
//    guard n > 1 else { return n} // 이걸로 0, 1 처리
    if index == 0 {
        return 0
    } else if index == 1 {
        return 1
    } else {
        return pibonachi(index: index - 1) + pibonachi(index: index - 2)
    }
}

print(pibonachi(index: 9))

// 기둥 3개. 원반 개수 : count 일 경우, 몇 회 이동해야 하노이의 탑을 완성하는지 반환
func hanoi(count: Int) -> Int {
    if count == 1 {
        return 0
    } else if count == 2 {
        return 3
    } else {
        return hanoi(count: count - 1) * 2 + 1
    }
}

print(hanoi(count: 7))


// 하노이의 탑 문제 푸는 방법(n번 기둥에서 m번 기둥으로 이동)까지 반환
func move(from: Int, to: Int) {
    print("\(from)번 기둥에서 \(to)기둥으로 이동")
}

// 원반 count개를 from기둥에서 by기둥을 거쳐 to기둥으로 전달
func hanoiMethod(count: Int, from: Int, by: Int, to: Int) -> Int {
    return 0
}

