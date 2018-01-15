``` swift
//
//  making shape.swift
//  XcodeTest
//
//  Created by 박성은 on 2018. 1. 15..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

// 각 도형별로 면적, 둘레, 부피 구하는 함수


func square(length: Int) -> (Int, Int, Int)
{
    let area = length * length
    let perimeter = 4 * length
    let volume = length * length * length
    return (area, perimeter, volume)
}

func rectangle(length: Int, width: Int, height: Int) -> (Int, Int, Int)
{
    let area = length * width
    let perimeter = 2 * (length+width)
    let volume = area * height
    return (area, perimeter, volume)
}

func circle(radius: Int, height: Int) -> (Double, String, String)
{
    let area = 3.14 * Double(radius) * Double(radius)
    
    // String(format: "%.2f", ~) >> 소수점 아래 두자리까지 표현
    let circumference = String(format: "%.2f", 2 * 3.14 * Double(radius))
    let sphereVolume = String(format: "%.2f", area * Double(radius) * 4 / 3)
    let circularCylinderVolume = String(format: "%.2f", area * Double(height))
    
    return (area, circumference, "sphere : \(sphereVolume), circularCylinder : \(circularCylinderVolume)")
}

func triangle(width: Int, height: Int) -> (Int,String)
{
    let radius = width / 2
    let area = width * height / 2
    let coneVolume = String(format: "%.2f", 3.14 * Double(radius) * Double(radius) * Double(height) / 3)
    
    return (area, coneVolume)
}


//결과값
print("area, perimeter, volume)")
print("suare : \(square(length: 3))")
print("rectangle : \(rectangle(length: 4, width: 5, height: 6))")
print("circle : \(circle(radius: 5, height: 4))")
print("triangle : \(triangle(width: 6, height: 4))")





/*
 
<1차 시도>
-. [도형-면적, 도형-둘레, 도형-부피] >> 각 도형당 3가지의 함수가 나오도록 작성
 >. 문제점 : 길이가 같은 값일 경우 함수를 3번 이용해야 한다는 단점.
 

func squareArea(length: Int) -> Int
{
    return length * length
}

func squarePerimeter(length: Int) -> Int
{
    return length * 4
}

func cubeVolume(length: Int) -> Int
{
    return length * length * length
}


<2차 시도>
 -.
 
let length: Int = 4
let area: Int = squareArea(length: length)
let perimeter: Int = squarePerimeter(length: length)
let volume: Int = cubeVolume(length: length)


func square(one: Int, two: Int, three: Int) -> (Int, Int, Int)
{
    let area = squareArea(length: one)
    let perimeter = squarePerimeter(length: two)
    let volume = cubeVolume(length: three)
    return(area, perimeter, volume)
}

let result: (are: Int, perimeter: Int, volume: Int) = square(one: 4, two: 5, three: 6)

 
 */
```