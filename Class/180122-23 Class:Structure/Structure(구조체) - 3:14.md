# ㅁ Structure(구조체) - 3/14
** Inflearn 야곱님 강의   
- 스위프트는 대부분의 타입이 구조체. 구조체는 값타입. 클래스는 참조타입.

```swfit
// 프로퍼티 및 메서드
struct Sample {
    // 인스턴스 프로퍼티. 즉. 외부에서 인스턴스 생성 후에 사용 가능
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티

    // 인스턴스 메서드
    func instanceMethod() {    }
    
    // Sample이라는 구조체 타입 자체에서 사용할 수 있는 프로퍼티 및 메서드
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100 
    // 타입 메서드
    static func typeMethod() {    }
}

// 구조체의 사용

// 가변 인스턴스 생성
var mutable: Sample = Sample()
// mutable 이라는 인스턴스에서 사용할 수 있는 인스턴스 프로퍼티
mutable.mutableProperty = 200

// mutable.immutableProperty = 200 -> Sample 구조체 내에서 불변 프로퍼티로 선언되었기 때문에 값 변경 불가

// 불변 인스턴스 생성
let immutable: Sample = Sample()
// immutable.mutableProperty = 200 -> 불변 인스턴스로 생성되었기 때문에 가변 프로퍼티도 변경 불가
// but, class일 경우에는, 불변 인스턴스도 가변 프로퍼티는 변경 가능

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()

// mutable.typeProperty = 400 -> error
// mutable.typeMethod() -> error
```

