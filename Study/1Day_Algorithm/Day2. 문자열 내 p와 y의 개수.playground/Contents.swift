//180124 - Day 2
//<문자열 내 p와 y의 개수>

//numPY함수는 대문자와 소문자가 섞여있는 문자열 s를 매개변수로 입력받습니다.
//s에 'p'의 개수와 'y'의 개수를 비교해 같으면 True, 다르면 False를 리턴하도록 함수를 완성하세요. 'p', 'y' 모두 하나도 없는 경우는 항상 True를 리턴합니다.
//예를들어 s가 pPoooyY면 True를 리턴하고 Pyy라면 False를 리턴합니다.

import UIKit

func numPY(_ s:String) -> Bool
{
    var result = true;
    var pCount = 0
    var yCount = 0
    
    // Array(String) : String -> Character Array
    let characters = Array(s)
    
    for n in 0..<characters.count
    {
        if characters[n] == "p" || characters[n] == "P"
        {
            pCount += 1
        }
        else if characters[n] == "y" || characters[n] == "Y"
        {
            yCount += 1
        }
    }
    
    if pCount == yCount
    {
        return result
    } else
    {
        result = false
        return result
    }
}

print(numPY("pPoooyY"))
print(numPY("Pyy"))

