import UIKit

//<if 기초>
//1-a. 정수를 하나 입력받아 그 수가 짝수이면 true를  반환하는 함수
//1-b. 문자열 두개를 입력받아 두 문자열이 같으면 true를 반환해주는 함수
//1-c. 두 수를 입력받아 큰 수를 반환하는 함수를 작성하세요.
//1-d. 정수를 하나 입력받아 3의 배수이면 true를 반환해주는 함수
//1-e. 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수 (첫번째 값을 두번째 값으로 나눈다. 0으로 나누기를 할시 0을 반환)

func isEven(num: Int) -> Bool
{
    if num % 2 == 0
    {
        return true
    }
    else
    {
        return false
    }
}

print("짝수 검사 : 343은")
print(isEven(num: 343))

func equal(str1: String, str2: String) -> Bool
{
    if str1 == str2
    {
        return true
    }
    else
    {
        return false
    }
}

equal(str1: "나", str2: "너")

func whichLarge(num1: Int, num2: Int) -> Int
{
    if num1 > num2
    {
        return num1
    }
    else if num1 < num2
    {
        return num2
    }
    else
    {
        print("두 숫자는 같습니다.")
        return 0
    }
}

whichLarge(num1: 321, num2: 34)

func multipleOf(three num: Int) -> Bool
{
    if num % 3 == 0
    {
        return true
    }
    else
    {
        return false
    }
}



func divide(num1: Int, num2: Int) -> Int
{
    if num2 != 00
    {
        return num1/num2
    }
    else
    {
        return 0
    }
}

divide(num1: 34, num2: 5)



//<응용>
//2-a. 시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")
//2-b. 여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수
//2-c. 윤년 구하기 문제(년도를 받아서 윤년인지 아닌지 판단하는 함수)
//2-d. 세 수를 입력받아 그 곱이 양수이면 true, 0 혹은 음수이면 false, 둘 다 아니면 에러를 발생시키는 함수를 작성하세요.



// 2-a-1. 시험점수를 등급으로 반환

// 강사님 함수명 : func grade(of score)
func test(score: Int) -> String
{
    var testScore: String = "F"
  
    // 100점 이상에 대한 예외처리 해줘야
    if score <= 100
    {
        if(95 <= score && score <= 100)
        {
            testScore = "A+"
        }
            
        // 강사님 feedback : 90 <= score 만 해도 충분
        else if (90 <= score && score < 95){
            testScore = "A"
        }
        else if (85 <= score && score < 90){
            testScore = "B+"
        }
        else if (80 <= score && score < 85){
            testScore = "B"
        }
        else {
            testScore = "C+"
        }
    }
    return testScore
}


//2-a-2. 성적 grade를 point로 변환
func convertPoint(from grade: String) -> Double
{
    var point: Double = 0.0
    if grade == "A+" {
        point = 4.5
    }
    else if grade == "A" {
        point = 4.0
    }
    else if grade == "B+" {
        point = 3.5
    }
    else if grade == "B" {
        point = 3.0
    }
    else {
        point = 2.5
    }
    return point
}

// 결과물
print(test(score: 87))
print(convertPoint(from: "B+"))

print(convertPoint(from: test(score: 39)))



//여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수
//윤년 구하기 문제(년도를 받아서 윤년인지 아닌지 판단하는 함수)
//세 수를 입력받아 그 곱이 양수이면 true, 0 혹은 음수이면 false, (생략 : 둘 다 아니면 에러를 발생시키는 함수를 작성하세요.)


func averageGrade(math: String, eng: String, kor: String) -> String
{
    let mathPoint = convertPoint(from: math)
    let engPoint = convertPoint(from: eng)
    let korPoint = convertPoint(from: kor)
    
    let totalPoint = mathPoint + engPoint + korPoint
    let averagePoint: Double = Double(totalPoint) / 3
    var grade: String = ""
    
    if averagePoint == 4.5
    {
        grade = "A+"
    }
    else if averagePoint >= 4.0
    {
        grade = "A"
    }
    else if averagePoint >= 3.5
    {
        grade = "B+"
    }
    
    else if averagePoint >= 3.0
    {
        grade = "B"
    }
    
    else if averagePoint >= 2.5
    {
        grade = "C+"
    }
    else
    {
        grade = "F"
    }
    return grade
}

print(averageGrade(math: "A+", eng: "B", kor: "C"))


func findLeapYear(from year:Int) -> String
{
    if (year % 400) == 0
    {
        return "윤년"
    }
    else if ((year % 100) != 0) && ((year % 4) == 0)
    {
        return "윤년"
    }
    else
    {
        return "윤년이 아닙니다."
    }
}

print(findLeapYear(from: 2016))


func signOfMultiple(num1: Int, num2: Int, num3: Int) -> Bool
{
    let multiple = num1 * num2 * num3
    if multiple >= 0
    {
        return true
    }
    else
    {
        return false
    }
}

print(signOfMultiple(num1: 8, num2: 1, num3: -2))
