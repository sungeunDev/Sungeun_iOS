# 180314 개인 스터디

## ㅁ 고차함수
- 하나 이상의 함수를 인자로 취하는 함수
- 함수를 결과로 반환하는 함수
> ※ High-order Function이 되기 위해서는 함수가 First-class Citizen 이어야 한다.

ㅇ 참고 링크 : [Simple Higher Order Functions in Swift](https://goo.gl/1w8qxR)  

- Why Use Higher Order Functions?
- 
> - Read and understand complex functional programming
> - Write more elegantly and maintainable code that has better readability
> - Improve our Swift language skills

<br>

### ㅇ 1급 객체 (First-class Citizen)
- 변수나 데이터에 할당할 수 있어야 한다.
- 객체의 인자로 넘길 수 있어야 한다.
- 객체의 리턴값으로 리턴할 수 있어야 한다.

```swift
func firstCitizen() {
    print("function call")
}

func function(_ parameter: @escaping ()->()) -> (()->()) {
    return parameter
}

let returnValue = function(firstCitizen)
returnValue()
```

<br>

### ㅇ Capturing Value
- 클로저는 자신이 정의된 주변 컨텍스트로부터 상수와 변수를 획득할 수 있음. 클로저는 상수와 변수들이 정의된 범위가 더이상 존재하지 않는 경우에조자도 값을 참조하거나 수정할 수 있음.
- Swift에서 가장 간단한 클로저는 다른 함수 내에 작성된 중첩 함수임. 중첩함수는 밖에 있는 상수와 변수를 획득할 수 있고 밖에 있는 함수의 인자도 획득할 수 있음.

- 예제
```swift
// incrementor 중첩 함수를 포함하는 mackIncrementor 함수
// 반환값 ( () -> Int ) 는 함수를 반환함을 의미. 
func makeIncrementor(forIncrement amount: Int) -> ( () -> Int ) {
    var runningTotal = 0

// incrementor 함수는 인자가 없지만 runningTotal과 amount를 함수 내부에서 참조
// 즉, 자신의 함수를 둘러싸고 있는(밖에 있는) 함수로부터 상수와 변수의 값을 획득하여 사용함
// 따라서 amount의 값을 수정하지 않기 때문에, incrementor 함수는 실제로 amount에 저장된 값을 캡쳐하고, 값의 복사본에 저장

// 그러나 runningTotal 변수는 호출될 때 마다 변경되는데 이는 incrementor는 현재 runningTotal 변수 참조를 획득하기 때문이며 초기 값의 복사는 하지 않음. 참조 획득은 makeIncrementor이 호출되고 끝날 때 사라지지 않음을 보증하며, incrementor 함수가 호출되고 난 다음에도 runningTotal이 계속 사용 가능함을 보증함.

    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor

    // 아래와 같이 구현해도 됨.
    var runningTotal = 0
    return {
        runningTotal += amount
        return runningTotal
        }
    }
```

- 위 예제에서 makeIncrementor를 매번 호출해 새로운 클로저를 생성할 때마다 새로 runningTotal 변수가 만들어지기 때문에, incrementByTen()과 incrementBySeven()은 각 클로저 내부의 runningTotal의 상태에 영향을 끼치지 못한다.
```swift
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen() // 10
incrementByTen() // 20
incrementByTen() // 30

// 두번째 incrementor를 만들더라도 runningTotal 변수는 분리되어 참조됨.
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven() // 7
```

- 클로저는 참조 타입

> 위 예에서처럼, incrementBySeven나 incrementByTen 자체는 상수(let으로 정의)였지만, 클로저에 잡혀있는 변수(runningTotal)는 호출할 때마다 변할 수 있다. 왜냐하면 incrementBySeven나 incrementByTen가 상수라서 가리키는 대상(참조)을 바꿀 수는 없지만, 그 대상 (클로저) 자체는 상태가 바뀔 수 있기 때문이다.
 참조이기 때문에, 클로저를 다시 다른 상수나 변수에 대입하면, 같은 대상 클로저를 가리킨다.

```swift
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen() // 40
```

<br>

### ㅁ 고차함수 종류
- map
- filter
- reduce
- flatMap

#### ㅇ map
- mapping(도표화) 라는 의미로 이해. 맵핑이란 일반적으로 메모리 맵을 제장하는 것을 의미.
- 컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성. 즉, 컬렉션의 각 항목의 데이터를 다른 데이터로 변경해주는 역할.
- 클로저를 이용, 각 항목에 대해 한 번 호출되며, 해당 항목에 대해 맵핑된 값을 반환

- 기본 문법
```swift
public func map<T>(_ transform: (Element) -> T) -> [T]
```

- 사용 예시1
```swift
let digitNames = [1, 2, 3, 4, 5]
let starList = digitNames.map { (number: Int) -> String in 
    var star = ""
    for _ in 0..<number {
        star += "*"
    }
    return star
}

print(starList)
// ["*", "**", "***", "****", "*****"]
```

- 사용 예시2
```swift
let number: [Int] = [0, 1, 2, 3, 4]
var doubledNumber: [Int]
var strings: [String]

// for - in 구문 사용할 경우
for number in numbers {
    doubledNumbers.append(number*2)
    stringNumbers.append(“\(number)")
}

// map method 사용
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return “\(number)"
})

// 매개변수, 반환타입, 반환 키워드(return) 생략 & 후행 클로저
doubledNumbers = numbers.map { $0 * 2 }
```

- 사용 예시3
```swift
// apple document example
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

// map의 받는 인자는 1개라서 후행클로저로 인자명 생략
let string = numbers.map { (num) -> String in
    var output = ""
    var numTemp = num
    while numTemp > 0 {
        output = digitNames[numTemp%10]! + output
        numTemp /= 10
    }
    return output
}

print(string)
// ["OneSix", "FiveEight", "FiveOneZero"]
```

#### ㅇ filter
- 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출. 즉, 컬렉션의 특정 아이템을 걸러내는 함수.
- 클로저를 통해 걸러내어야 하는 데이터의 조건을 전달해주고, Bool로 반환. 반환값 true인 경우에 해당하는 값만 컬렉션에 추가

- 기본 문법
```swift
public func filter(_ isIncluded: (Element) -> Bool) -> [Element]
```

- 사용 예시
```swift
// for - in 사용
// 이 경우 append하기 때문에 프로퍼티를 변수로 지정해야 함.
var filtered: [Int] = [Int]()
for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)

// filter method 사용. 프로퍼티를 상수로 지정해도 가능.
let evenNumbers = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
})

// 축약 문법
let evenNumbers: [Int] = numbers.filter{ $0 % 2 == 0 }
```

#### ㅇ reduce
- 컨테이너 내부의 콘텐츠를 하나로 통합. 즉, 컬렉션 내부의 모든 컨텐츠의 값을 하나로 합쳐주는 함수
- 인자를 2개 받으며 첫번째 인자는 초기값, 두번째 인자는 클로저로 결과값과 각 인자를 합치는 역할을 함.

- 기본 문법
```swift
public func reduce<Result>(_ initialResult: Result,
                      _ nextPartialResult: (Result, Bound) -> Result) -> Result
```

- 사용 예시
```swift
 let sumNumbers: [Int] = [2, 8, 15]

// for - in 사용. 변수 var 사용
var result: Int = 0
for number in sumNumbers {
    result += number
}

// reduce method
// 초기값 0. sumNumbers 내부의 모든 값을 더함.
// sum이라는 let 상수에 값을 더하는데, 뒤에 값을 바꾸는 로직이 없으므로 상수를 사용할 수 있습니다. 앞서 for 문에서는 var 변수로 선언해야 하기 때문에 나중에 의도하지 않게 값을 변화할 여지가 있으므로 고차원 함수로 사용하면 이런 실수를 줄일 수 있다는 장점이 있습니다.

let sum: Int = sumNumbers.reduce(0) {(first: Int, second: Int) -> Int in
    return first + second
}

// 축약형
let sum: Int = sumNumbers.reduce(0) { $0 + $1 }
```

#### ㅇ flatMap
- 중첩된 컬렉션을 하나의 컬렉션으로 병합.
- 요소 중 옵셔널이 있을 경우 제거

