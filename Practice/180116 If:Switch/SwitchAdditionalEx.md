# [ 조건문 실습 - Switch ]


## ㅁ 실습 내용


- 월을 입력받아 해당월의 이름을 반환해주는 함수 (ex: 1 >>> "Jan", 12 >>> "Dec", 13 >> "Error"
- 년/월을 입력받아 해당 들의 마지막 날을 반환 해주는 함수(윤년 고려)
- if문 변환
- 시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")

<br>

## ㅁ 결과값
``` swift
6월은 영어로 Jun.
1900년 2월의 마지막 날은 29일 입니다.
```

<br>

## ㅁ Code

``` swift
//switch-case
//1. 월을 입력받아 해당월의 이름을 반환해주는 함수 (ex: 1 >>> "Jan", 12 >>> "Dec", 13 >> "Error"
//2. 년/월을 입력받아 해당 들의 마지막 날을 반환 해주는 함수(윤년 고려)
//3. if문 변환
//4. 시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")

import Foundation

func monthName(from month: Int) -> String
{
    switch month {
    case 1:
        return "Jan."
    case 2:
        return "Feb."
    case 3:
        return "Mar."
    case 4:
        return "Apr."
    case 5:
        return "May."
    case 6:
        return "Jun."
    case 7:
        return "Jul."
    case 8:
        return "Agu."
    case 9:
        return "Sep."
    case 10:
        return "Oct."
    case 11:
        return "Nov."
    case 12:
        return "Dec."
    default:
        return "Error"
    }
}

print("6월은 영어로 \(monthName(from: 6))")



func findLeapYear(year: Int) -> Bool
{
    //윤년찾기
    switch year%4 {
    case 0 where (year%400) == 0 && (year%100) == 0:
        return true
//    case 0 where (year%100) == 0:
//        return false
    case 0:
        return true
    default:
        return false
    }
}

findLeapYear(year: 2016)

func lastDayOf(year: Int, month:Int) -> Int
{
    var lastDay: Int = 30
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        lastDay = 31
        return lastDay
    case 2:
        // 삼항 연산자 이용
        // 조건 ? true : false
        findLeapYear(year: year) == true ? (lastDay = 29) : (lastDay = 28)
        return lastDay
    default:
        return lastDay
    }
}

print("1900년 2월의 마지막 날은 \(lastDayOf(year: 1900, month: 2))일 입니다.")

// 튜플, 바인딩 활용해서 코딩해보기
```