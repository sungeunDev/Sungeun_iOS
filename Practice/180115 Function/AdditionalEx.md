# [ 함수 실습 - 추가 예제 ]


## ㅁ 실습 내용

### <기초>

* 1-a 이름(문자열)을 받아서 이름을 출력하는 함수
* 1-b 나이*(정수)를 받아서 나이를 출력하는 함수
- 1-c.이름과 주소를 입력받아 자기소개글을 프린트 하는 함수(자기소개글은 자유)
- 정수를 하나 입력받아서 2로 나눈 값을 반환해주는 함수
- 정수를 하나 입력받아서 제곱을 반환해주는 함수

### <응용 - 다중 입력, 반환>
- 2-a. 두개의 정수를 입력받아 두수의 합을 반환해주는 함수
- 2-b. 두개의 정수를 입력받아 두수의 차를 반환해주는 함수
- 2-c. 두개의 정수를 입력받아 두수의 곱을 반환해주는 함수
- 2-d. 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수

### <응용>
- 부모님과 내 나이를 입력 후 그 나이차를 프린드 하는 함수   
  (ex: "어머니의 나이는 40세이고 내 나이는 20살이므로 우리의 나이차이는 20살 입니다.)
- 시험점수 여러개를 입력받아서(4개이상) 평균을 반환해주는 함수

### <캐스팅>
- 정수를 하나 입력받아서 실수로 변환 후 반환해주는 함수
- 정수를 두개를 입력받아 두수를 합친수를 출력하는 함수   
 (ex: 3,4 입력시 >>> 34 /// 1,0 입력시 >>> 10)
- 실수를 하나 입력받아서 소수점 첫번재 자리에서 반올림 후 정수를 반환해주는 함수

<br>

## ㅁ 결과값

``` swift
박성은
27
이름 : 박성은, 주소 : 경기도 성남시 중원구
부모님과 나의 나이 차이 : 33살
박성은의 시험 평균 : 83.75점
입력한 수 : 4, 5
문자로 합치기 : 45
실수 입력, 소수점 첫번째 자리에서 정수 반올림
입력값 : 14.86, 결과값 : 15
입력값 : 1.2, 결과값 : 1
```

<br>

## ㅁ Code

``` swift
//<기초>
//1-a 이름(문자열)을 받아서 이름을 출력하는 함수
//1-b 나이*(정수)를 받아서 나이를 출력하는 함수
//1-c.이름과 주소를 입력받아 자기소개글을 프린트 하는 함수(자기소개글은 자유)
//정수를 하나 입력받아서 2로 나눈 값을 반환해주는 함수
//정수를 하나 입력받아서 제곱을 반환해주는 함수

import Foundation

var name = "박성은"
var age = 27
var adress = "경기도 성남시 중원구"

func nameOutput(from name: String)
{
    print(name)
}

func ageOutput(from age: Int)
{
    print(age)
}

func introduction(name: String, adress: String)
{
    print("이름 : \(name), 주소 : \(adress)")
}

nameOutput(from: name)
ageOutput(from: 27)
introduction(name: name, adress: adress)


func divide(into two: Int) -> Int
{
    return two / 2
}

func square(_ input: Int) -> Int
{
    return input * input
}

//<응용 - 다중 입력, 반환>
//2-a. 두개의 정수를 입력받아 두수의 합을 반환해주는 함수
//2-b. 두개의 정수를 입력받아 두수의 차를 반환해주는 함수
//2-c. 두개의 정수를 입력받아 두수의 곱을 반환해주는 함수
//2-d. 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수


func plus(firstNum: Int, secondNum: Int) -> Int
{
    return firstNum + secondNum
}

func minus(firstNum: Int, secondNum: Int) -> Int
{
    return firstNum - secondNum
}

func multiple(firstNum: Int, secondNum: Int) -> Int
{
    return firstNum * secondNum
}

func divide2(firstNum: Int, secondNum: Int) -> Int
{
    return firstNum / secondNum
}

//<응용>
//부모님과 내 나이를 입력 후 그 나이차를 프린트 하는 함수 (ex: "어머니의 나이는 40세이고 내 나이는 20살이므로 우리의 나이차이는 20살 입니다.)
//시험점수 여러개를 입력받아서(4개이상) 평균을 반환해주는 함수

func ageGap(parent between: Int, me: Int)
{
    let gap = between - me
    print("부모님과 나의 나이 차이 : \(gap)살")
}

ageGap(parent: 60, me: age)

func averageTestScore(math: Int, eng: Int, sci: Int, kor: Int)
{
    let sum: Int = math + eng + sci + kor
    let avg: Double = Double(sum) / 4
    let avgStr : String = String(format: "%.2f", avg)
    print("\(name)의 시험 평균 : \(avgStr)점")
}

averageTestScore(math: 100, eng: 90, sci: 50, kor: 95)


//<캐스팅>
//정수를 하나 입력받아서 실수로 변환 후 반환해주는 함수
//정수를 두개를 입력받아 두수를 합친수를 출력하는 함수 (ex: 3,4 입력시 >>> 34 /// 1,0 입력시 >>> 10)
//실수를 하나 입력받아서 소수점 첫번재 자리에서 반올림 후 정수를 반환해주는 함수

func intCasting(to double: Int) -> Double
{
    return Double(double)
}

func addNumber(firstNum: Int, secondNum: Int)
{
    let addNum: String = String(firstNum) + String(secondNum)
    print("입력한 수 : \(firstNum), \(secondNum)")
    print("문자로 합치기 : \(addNum)")
}

addNumber(firstNum: 4, secondNum: 5)

func roundInt(from x: Double) -> Int
{
    let y = Int(x * 10) % 10
    if y < 5
    {
        return Int(x)
    }
    else
    {
        return Int(x+1)
    }
}

print("실수 입력, 소수점 첫번째 자리에서 정수 반올림")
print("입력값 : 14.86, 결과값 : \(roundInt(from: 14.86))")
print("입력값 : 1.2, 결과값 : \(roundInt(from: 1.2))")
```

