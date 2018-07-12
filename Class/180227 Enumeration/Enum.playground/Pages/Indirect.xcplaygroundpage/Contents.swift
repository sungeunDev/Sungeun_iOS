//: [Previous](@previous)

// 각각의 case에 순환 열거형 명시
enum ArithmeticExpressionCase {
  case number(Int)
  indirect case addition(ArithmeticExpressionCase, ArithmeticExpressionCase)
  indirect case multiplication(ArithmeticExpressionCase, ArithmeticExpressionCase)
}


// enum 전체에 순환 열거형 명시
indirect enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// 예제. p104
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
  switch expression {
  case .number(let num):
    return num
  case .addition(let left, let right):
    return evaluate(left) + evaluate(right)
  case .multiplication(let left, let right):
    return evaluate(left) * evaluate(right)
  }
}

let result: Int = evaluate(final)
