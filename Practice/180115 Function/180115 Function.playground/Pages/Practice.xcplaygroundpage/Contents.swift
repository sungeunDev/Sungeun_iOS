//: Playground - noun: a place where people can play

import UIKit

let sampleText = "<<<Hello>>>"
let startIndex = sampleText.index(sampleText.startIndex, offsetBy: 3)
let endIndex = sampleText.index(sampleText.endIndex, offsetBy: -4)

let substring1: Substring = sampleText[startIndex...endIndex]
let resultStr:String = String(substring1)

print(resultStr)

(Int.max)
(Int.min)

var sampleTuple: (Int, Int) = (3, 4)
print(sampleTuple)


func calculator(num1: Int, num2: Int) -> (Int, String)
{
    let sum: Int = num1 + num2
    return (sum, String(sum))
}

let result: (intSum: Int, strSum: String) = calculator(num1: 10, num2: 3)
let intResult: Int = result.intSum
let stringResult: String = result.strSum


var coin: (Int, Int, Int, Int) = (3, 4, 5, 6)
print("10원짜리 \(coin.1)개")

func moneySum(십원: Int, 백원 :Int, 천원 :Int) -> (Int, Int, String)
{
    let coinSum: Int = 십원 + 백원 + 천원
    let moneySum: Int = 십원 * 10 + 백원 * 100 + 천원 * 1000
    let 총계: String = "x"
    return (coinSum, moneySum, 총계)
}

let result2: (Int, Int, Int) = moneySum(십원: 4, 백원: 3, 천원: 1)
print (result2)

var stringNum: String
var doubleNum: Double
var intNum: Int = 3

stringNum = String(intNum)
doubleNum = Double(intNum)

