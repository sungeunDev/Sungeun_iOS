# [ 조건문 실습 - Switch ]


## ㅁ 실습 내용

### <기초>

* Switch 시험점수를 등급으로 반환
* Switch 성적 grade를 point로 변환

### <응용>
* 도형 넓이, 부피 구하기 (튜플, 값 바인딩, Where문 이용)

<br>

## ㅁ 결과값

``` swift
C+
3.5
4.0

<면적 구하기 실습 결과물>
도형 : 정사각형, 면적 : 16.0
도형 : 직사각형, 면적 : 12.0
도형 : 원, 면적 : 78.5
도형 : 매칭되는 도형 없음, 면적 : 0.0

<부피 구하기 실습 결과물>
도형 : 직육면체, 부피 : 60.0
도형 : 정육면체, 부피 : 27.0
도형 : 직육면체, 부피 : 9.0
도형 : 원기둥, 부피 : 392.5
도형 : 원기둥, 부피 : 0.0
도형 : 매칭되는 도형 없음, 부피 : 0.0

<삼각 도형 면적, 부피 구하기 실습 결과물>
도형 : 사다리꼴, 면적 : 10.0, 부피 : 0.0
도형 : 삼각형, 면적 : 4.0, 부피 : 0.0
도형 : 원뿔, 면적 : 0.0, 부피 : 169.56
도형 : 매칭되는 도형 없음, 면적 : 0.0, 부피 : 0.0
```

<br>

## ㅁ Code

```swift
import Foundation

//Switch 시험점수를 등급으로 반환
//Interval Matching 이용

func grade(of score: Int) -> String
{
var testScore: String = "F"
switch score {
case 95...100:
testScore = "A+"
case 90..<95:
testScore = "A"
case 85..<90:
testScore = "B+"
case 80..<85:
testScore = "B"
case 75..<80:
testScore = "C+"
default:
testScore = "F"
}
return testScore
}


//Switch 성적 grade를 point로 변환
func convertPointSwitch(from grade: String) -> Double
{
var point: Double = 0.0
switch grade {
case "A" :
point = 4.0
case "B+":
point = 3.5
case "B":
point = 3.0
case "C+":
point = 2.5
default :
point = 2.0
}
return point
}

// 결과물

print(grade(of: 78))
print(convertPointSwitch(from: "B+"))

print(convertPointSwitch(from: grade(of: 92)))



// 튜플 매칭, 값 바인딩 이용
// 도형 넓이 구하기


func area(length: Double, width :Double, radian: Double)
{
let compareData = (length, width, radian)
var area: Double = 0.0
var shape: String = ""

switch compareData {
case (let x, 0, 0):
area = x * x
shape = "정사각형"
case (let x, let y, 0):
area = x * y
shape = "직사각형"
case (0, 0, let r):
area = 3.14 * r * r
shape = "원"
default :
area = 0
shape = "매칭되는 도형 없음"
}
print("도형 : \(shape), 면적 : \(area)")
}

print("<면적 구하기 실습 결과물>")
area(length: 4, width: 0, radian: 0)
area(length: 3, width: 4, radian: 0)
area(length: 0, width: 0, radian: 5)
area(length: 3.5, width: 4, radian: 5)


func volume(length: Double, width: Double, height: Double, radius: Double)
{
let compareData = (length, width, height, radius)
var volume: Double = 0
var shape: String = ""
switch compareData
{
case let(x, y, z, 0) where x == y && y == z:
volume = x * x * x
shape = "정육면체"
case (let x, let y, let z, 0):
volume = x * y * z
shape = "직육면체"
case (0, 0, let x, let y):
volume = 3.14 * y * y * x
shape = "원기둥"
case (0, 0, 0, let x):
volume = 4 / 3 * 3.14 * x * x * x
shape = "구"
default:
volume = 0
shape = "매칭되는 도형 없음"
}
print("도형 : \(shape), 부피 : \(volume)")
}

print("<부피 구하기 실습 결과물>")
volume(length: 3, width: 4, height: 5, radius: 0)
volume(length: 3, width: 3, height: 3, radius: 0)
volume(length: 3, width: 3, height: 1, radius: 0)
volume(length: 0, width: 0, height: 5, radius: 5)
volume(length: 0, width: 0, height: 0, radius: 5)
volume(length: 3, width: 4, height: 5, radius: 1)

// parameter에 기본값이 있을 경우, 함수 호출 시 값을 입력하지 않아도 됨.

func triangle(above: Double = 0, below: Double = 0, height: Double = 0, radius: Double = 0)
{
let comparePoint = (above, below, height, radius)
var area: Double = 0
var shape: String = ""
var volume: Double = 0
switch comparePoint {
case (let a, 0, let h, 0):
area = a * h / 2
shape = "삼각형"
case (let a, let b, let h, 0):
area = (a + b) * h / 2
shape = "사다리꼴"
case (0, 0, let h, let r):
shape = "원뿔"
volume = 3.14 / 3 * r * r * h
default:
shape = "매칭되는 도형 없음"
}
print("도형 : \(shape), 면적 : \(area), 부피 : \(volume)")
}

print("<삼각 도형 면적, 부피 구하기 실습 결과물>")
triangle(above: 2, below: 3, height: 4)
triangle(above: 2, height: 4)
triangle(height: 2, radius: 9)
triangle(above: 1, below: 2, height: 3, radius: 4)


```

