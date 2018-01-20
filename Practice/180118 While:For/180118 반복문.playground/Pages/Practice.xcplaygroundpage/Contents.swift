import Foundation

// 연습문제 1. 알고리즘(Collatz 추측)
// 입력된 수가 짝수라면 2로 나누고, 홀수라면 3을 곱하고 1을 더한 다음, 결과로 나온 수에 같은 작업을 1이 될 때까지 반복할 경우 모든 수가 1이 된다는 추측
// collatz함수로 몇번만에 1이 되는지 반환. 단, 500번을 반복해도 1이 되지 않을 경우 -1 반환

func collatz(in num: Int64) -> Int
{
    var numTemp = num
    var count = 0
    while numTemp != 1
    {
        if numTemp % 2 == 0
        {
            numTemp /= 2
        }else
        {
            numTemp = numTemp * 3 + 1
        }
        count += 1
        if count >= 500
        {
            return -1
        }
    }
    return count
}

print("Collartz 알고리즘 - 입력값: 354, 결과값: \(collatz(in: 354))")
print("Collartz 알고리즘 - 입력값: 9319999999973338, 결과값: \(collatz(in: 9319999999973338))")


// for-in 이용하면 어떻게 짤 수 있는지?
// >. for문은 횟수가 정해져 있는 것. 위 알고리즘은 놉. 그래서 for문으로 작성 불가!



// 연습문제 2. 알고리즘(Harshad 수)
// 양의 정수 x가 하샤드 수이려면, x의 자릿 수의 합으로 x가 나누어져야 한다. 입력값이 하샤드 수인지 판별하는 함수 작성

func harshad(in num: Int) -> Bool
{
    let result: Bool = (num % addAll(num)) == 0 ? true : false
    return result
}

func addAll(_ num: Int) -> Int
{
    var num2 = num
    var sum = 0
    while num2 > 0 {
        sum += (num2 % 10)
        num2 /= 10
    }
    return sum
}

print("Harshad 알고리즘 - 입력값: 123, 결과값: \(harshad(in: 123))")
print("Harshad 알고리즘 - 입력값: 12, 결과값: \(harshad(in: 12))")
