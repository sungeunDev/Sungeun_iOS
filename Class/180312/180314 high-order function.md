# 180314 개인 스터디

##ㅁ Closure 예제 - 고차함수

### ㅇ 종류
- map
- filter
- reduce

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