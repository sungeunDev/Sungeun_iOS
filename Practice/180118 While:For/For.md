# [ 반복문 실습 - for-in ]


## ㅁ 실습 내용

### <기초>
* 1-a 구구단
* 1-b 삼각수 : 정수 하나를 입력받아서 1부터 입력받은 수까지의 모든 수를 더한값을 반환해주는 함수
* 1-c 팩토리얼
* 1-d 정수를 받아서 각 자리의 합을 반환해주는 함수
* 1-e 리버스

### <응용>
- 정수 두개를 입력받아서 첫번째 수를 두번째 수의 횟수 만큼 곱한 값을 반환해주는 함수 (ex: 2,3 >>> 8 /// 3,3 >>> 27)
- 정수 하나를 받아서 1부터 정수까지의 숫자중 짝수를 모두 출력해주는 함수
- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
- 정수 하나를 받아서 그 정수의 약수를 출력하는 함수
- 2 이상의 정수를 입력받아, 그 수가 소수인지 아닌지를 판별하는 함수
- 정수 하나를 입력받아서 입력받은 수 번째 피보나치 수를 반환하는 함수를 작성하세요. (ex: 3 >>> 2, 7 >>> 13)

<br>

## ㅁ 결과값
``` swift
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27
+ : 55
! : 120

삼각수 : 66
각 자리수 더하기 : 5
리버스 : 354321
```

<br>

## ㅁ Code

``` swift
import Foundation

func timeTableFor(_ time: Int)
{
    for count in 1...9
    {
        print("\(time) * \(count) = \(time * count)")
    }
}

timeTableFor(3)


func ex(_ time: Int) -> Int
{
    var i: Int = 0
    var sum: Int = 0
    
    for _ in 1...10
    {
        i += 1
        sum += i
    }
    return sum
}

print(ex(10))


//팩토리얼 !!

func factorial(_ time:  Int) -> Int
{
    var timeTemp: Int = time
    var result: Int = 1
    for _ in 1...(time)
    {
        result *= timeTemp
        timeTemp -= 1
    }
    return result
}

//for-in은 {} 끝나면 자동으로 다음 값 대입. +1 해줄필요 놉.
func factorialTecher(in time: Int) -> Int
{
    var result: Int = 1
    for n in 1...time
    {
        result *= n
    }
    return result
}

print(factorial(5))
print(factorialTecher(in: 5))

//삼각수 구하기 for-in ver
func triangular(_ num: Int) -> Int
{
    var sum = 0
    for numTemp in 1...num
    {
        sum += numTemp
    }
    return sum
}

print(triangular(11))

//각 자리수 더하는 메소드 for-in ver
func addAll(_ num: Int) -> Int
{
    var numTemp = num
    var result = 0
    for _ in 1...num
    {
        result += numTemp % 10
        numTemp /= 10
    }
    return result
}
print(addAll(1121))

//숫자 리버스 함수 for-in ver
func reverse(_ num: Int) -> String
{
    var numTemp = num
    var result:String = ""
    for _ in 1...String(num).count
    {
        result += String(numTemp%10)
        numTemp /= 10
    }
    return result
}

print(reverse(123453))
```