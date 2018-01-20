//: Playground - noun: a place where people can play

import UIKit


//Element 삽입
var num = [1, 2, 3, 4, 5]
num.insert(contentsOf: 100...102, at: 3)
print(num)

num.insert(100, at: 2)
print(num)

num.remove(at: 2)
print(num)

num.removeLast()
print(num)

num.removeSubrange(2...4)
print(num)

print(num.count)
print(num.isEmpty)

num.append(contentsOf: 9...13)
num.append(24)
print(num)

num.isEmpty
//배열의 Element 갯수
//빈 배열 확인
//Element 추가
//Element 삽입
//Element 삭제


func arrayTest()
{
    var list: [String] = ["my", "name", "is", "a"]
    list.append("sungeun")
    print("list 배열의 총 갯수", list.count)
    print(list[3])
    
    list.remove(at: 3)
    list.insert("my introduce it my self.", at:0)
    
    for text in list
    {
        print(text)
    }
}



