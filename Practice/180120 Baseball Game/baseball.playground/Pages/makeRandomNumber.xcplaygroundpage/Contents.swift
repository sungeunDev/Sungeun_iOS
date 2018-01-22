//: Playground - noun: a place where people can play

import UIKit

private func makeRandomNumber() -> [Int]
{
var randomNumberList:[Int] = []

//랜덤 숫자 얻는 코드! 10 = 0~9까지는 랜덤숫자한개
let randomNum:Int = Int(arc4random_uniform(10))
let randomNum2:Int = Int(arc4random_uniform(10))
let randomNum3:Int = Int(arc4random_uniform(10))

randomNumberList.append(randomNum)
randomNumberList.append(randomNum2)
randomNumberList.append(randomNum3)

var m = 0
var n = 1

while m < 3
{
    n = m+1
    while n < 3
    {
        if randomNumberList[m] == randomNumberList[n]
        {
            let randomNum2Temp:Int = Int(arc4random_uniform(10))
            randomNumberList[n] = randomNum2Temp
        }else
        {
            n += 1
        }
    }
    m += 1
}

return randomNumberList
}

makeRandomNumber()



