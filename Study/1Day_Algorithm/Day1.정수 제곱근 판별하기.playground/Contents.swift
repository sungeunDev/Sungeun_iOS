//180123 - Day 1
//<정수 제곱근 판별하기>

//nextSqaure함수는 정수 n을 매개변수로 입력받습니다.
//n이 임의의 정수 x의 제곱이라면 x+1의 제곱을 리턴하고, n이 임의의 정수 x의 제곱이 아니라면 'no'을 리턴하는 함수를 완성하세요.
//예를들어 n이 121이라면 이는 정수 11의 제곱이므로 (11+1)의 제곱인 144를 리턴하고, 3이라면 'no'을 리턴하면 됩니다.

import UIKit

// x^2 = n 이 되는 정수 x를 찾는 로직
func nextSqaure(_ n: Int) -> String
{
    // x의 최대값 = n의 제곱근의 정수형
    // - sqrt(Double) : 제곱근 함수
    let valueMax = Int(sqrt(Double(n)))
    for x in 1...valueMax
    {
        // - pow(Decimal: x, Int: n) -> Decimal: x^n : 제곱 함수
        // - Decimal : 십진법
        if pow(Decimal(x), 2) == Decimal(n)
        {
            let result = pow(Decimal(x+1), 2)
            
            // - describing : 문자를 있는 그대로 표현. 인스턴스가 ~한 프로토콜을 갖고 있는 경우 발현.
            // ex. let p = Point(x: 21, y: 30)
            ///     print(String(describing: p))
            ///     Prints "Point(x: 21, y: 30)"
            return String(describing: result)
        }
    }
    return "no"
}

print("결과 : " + nextSqaure(121));
