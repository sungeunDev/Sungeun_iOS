# [ 반복문 실습 - While ]


## ㅁ 실습 내용


- 

<br>

## ㅁ 결과값
``` swift
구구단 만들기, 입력값 : 3
3단
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27

1-a. 삼각수 구하기 - 입력값 : 9, 삼각수 : 45
1-b. 각 자리 수 더하기 - 입력값 : 123456, 결과값 : 21
1-c. 숫자 리버스 - 입력값 : 12345, 결과값 : 54321

```

<br>

## ㅁ Code

``` swift
import UIKit

//구구단 만들기

func timesTable(_ times: Int)
{
    print("\(times)단")
    var count:Int = 1
    while count<10 {
        print("\(times) * \(count) = \(times * count)")
        count += 1
    }
}

print("구구단 만들기, 입력값 : 3")
print(timesTable(3))

//1-a. 삼각수 구하기(1부터 입력한 수까지의 합)
//1-b. 각 자리 더하는 메소드
//1-c. 숫자 리버스 함수


func triangular(_ num: Int) -> Int
{
    // 입력값(num)은 무조건 상수이므로 입력값을 받아주는 변수를 생성해서 진행해야 함.
    var num2 = num
    var sum = 0
    while num2 > 0 {
        sum += num2
        num2 -= 1
    }
    return sum
}
print("1-a. 삼각수 구하기 - 입력값 : 9, 삼각수 : \(triangular(9))")


func addAll(_ num: Int) -> Int
{
    var num2 = num
    var sum = 0
    while num2 > 0 {
        sum += (num2 % 10)
        num2 /= 10
    }
    return sum
}

print("1-b. 각 자리 수 더하기 - 입력값 : 123456, 결과값 : \(addAll(123456))")


func reverse(_ num: Int) -> String
{
    var num2 = num
    var sum = ""
    while num2 > 0 {
        sum += String(num2 % 10)
        num2 /= 10
    }
    return sum
}

print("1-c. 숫자 리버스 - 입력값 : 12345, 결과값 : \(reverse(12345))")
```