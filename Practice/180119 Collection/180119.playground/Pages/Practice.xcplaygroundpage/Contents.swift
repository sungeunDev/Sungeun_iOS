//### <Level 1>
//- 1-a. 시작과 끝수를 받아서 두 수 사이의 모든 수를 가지고 있는 배열 만들기
//- 1-b. 정수 타입의 배열을 입력받아 모든 배열의 수의 합을 리턴하는 함수
//- 1-c. 딕셔너리에 있는 모든 데이터 출력하는 함수 >> 데이터: ["name":"joo", "age":20, "job":"Developer"]

import Foundation

// 1-a.
func betweenArray(num1: Int, num2: Int) -> [Int]
{
    var num = [num1, num2]
    num.insert(contentsOf: (num1+1)..<num2, at: 1)
    return num
}

// 1-a. 강사님 버전
func makeList(start: Int, end: Int) -> [Int]
{
    var returnList: [Int] = []
    for n in start...end
    {
        returnList.append(n)
    }
    
//  while 버전
//    var index: Int = start
//    while index <= end {
//        returnList.append(index)
//        index += 1
//    }
    
    return returnList
}

betweenArray(num1: 2, num2: 8)
makeList(start: 3, end: 9)

// 1-b.
let list: [Int] = [1, 3, 4, 5, 4, 12]


func addAllAray(input: [Int]) -> Int
{
    var sum = 0
    for n in 0...(input.count-1)
    {
        let Temp = input[n]
        sum += Temp
    }
    return sum
}

// 1-b. 강사님 버전
/// 1-b. 정수 타입의 배열을 입력받아 모든 배열의 수의 합을 리턴하는 함수
///
/// - Parameter list: 배열
/// - Returns: 모든 배열의 수의 합
func sum(of list: [Int]) -> Int
{
    var result = 0
    for num in list
    {
        result += num
    }
    return result
}

addAllAray(input: list)

// 1-c.
let dicList: [String:Any] = ["name":"joo", "age":20, "job":"Developer"]
func dic(_ input: [String:Any])
{
    for (key, value) in input
    {
        //딕셔너리의 키값은 key 변수에, value값은 value 변수에
        print("\(key) : \(value)")
    }
}

dic(dicList)

//Level 2
//2-a. 정수 타입의 배열을 받아서 배열안의 중복된 수를 모두 제거된 배열을 반환하는 함수
// -. func array.contains(n) >> 배열 안에 n값이 있는지 확인해줌
// -. array -> set(중복 제외하고 받아들임) -> array 재변환

let listRepeat: [Int] = [1, 1, 4, 3, 1, 3, 4, 5, 4, 12]
func removeRepeat(input: [Int]) -> [Int]
{
    var inputTemp: [Int] = input
    var m = 0
    var n = 1
    
    while m < inputTemp.count
    {
        n = m+1
        while n < inputTemp.count
        {
            if inputTemp[m] == inputTemp[n]
            {
                inputTemp.remove(at: n)
            }
            n += 1
        }
        m += 1
    }
    return inputTemp
}
removeRepeat(input: listRepeat)

//2-a. 강사님 ver
func removeDuplicate(of list:[ Int]) -> [Int]
{
    var resultList: [Int] = []
    
    for n in list
    {
        if !resultList.contains(n)
        {
            resultList.append(n)
        }
    }
    return resultList
}



//2-b. 정수 배열을 입력받아, 배열의 요소 중 두 개를 선택하는 조합을 모두 포함하는 배열을 작성하세요.
//>> [1, 2, 3] -> [[1, 2], [1, 3], [2, 3]]

var a: [Int] = [1, 2, 3, 4]
func includeTwoArray(input : [Int]) -> [Any]
{
    var result : [Any] = []
    
    var m = 0
    var n = 1
    
    while m < input.count
    {
        n = m+1
        while n < input.count
        {
            result.append([input[m], input[n]])
            n += 1
        }
        m += 1
    }
    return result
}

includeTwoArray(input: a)

// 2-b 강사님 버전
// 이중배열. for문 이용 list[]가져오기 -> append로 배열 추가
func seperate(list: [Int]) -> [[Int]]
{
    var resultList: [[Int]] = []
    for n in 0..<list.count
    {
        let firstV = list[n]
        
        for i in n+1..<list.count
        {
            let secondV = list[i]
            resultList.append([firstV, secondV])
        }
    }
    return resultList
}

//Level 3
//3-a. 정수 타입의 배열을 입력받아서 오름차순으로 정렬된 배열을 만들어 리턴하시오.(정렬 함수 사용x)   (정렬의 효율은 보지 않습니다.)

//for-in version
let sortTest: [Int] = [4, 23, 15, 3, 8]
func upSortFor(list: [Int]) -> [Int]
{
    var inputTemp: [Int] = list
    var temp = 0
    for m in 0..<inputTemp.count
    {
        for n in m+1..<inputTemp.count
        {
            if inputTemp[m] > inputTemp[n]
            {
                temp = inputTemp[m]
                inputTemp[m] = inputTemp[n]
                inputTemp[n] = temp
            }
        }
    }
    return inputTemp
}
upSortFor(list: sortTest)

//while version
func upSort(input: [Int]) -> [Int]
{
    var inputTemp = input
    var m = 0
    var n = 1
    
    while m < input.count
    {
       n = 0
        while n < input.count
        {
            if inputTemp[m] < inputTemp[n]
            {
                let temp = inputTemp[m]
                inputTemp[m] = inputTemp[n]
                inputTemp[n] = temp
                n = 0
            }
            else
            {
                n += 1
            }
        }
        m += 1
    }
    return inputTemp
}

upSort(input: sortTest)


//강사님 버전
func selectionSort(list: [Int]) -> [Int]
{
    var muList = list
    for originIndex in 0..<muList.count
    {
        var minNum = muList[originIndex]
        var minIndex = originIndex
        
        for selectIndex in (originIndex+1)..<muList.count
        {
            let selectNum = muList[selectIndex]
            if minNum > selectNum
            {
                minNum = selectNum
                minIndex = selectIndex
            }
        }
        
        if originIndex != minIndex
        {
            muList.swapAt(originIndex, minIndex)
        }
    }
    return muList
}
selectionSort(list: sortTest)

let list2 = [1, 2, 3, 4, 5 ,6, 7, 8]
func swap2(_ list: [Int]) -> [Int]
{
    var list2 = list
    list2.swapAt(3, 1)
    
    return list2
}
swap2(list2)


//3-b. 에라토스테네스의 체 알고리즘을 이용하여  입력된 숫자까지의 모든 소수의 배열을 반환하는 함수
//2부터 소수를 구하고자 하는 구간의 모든 수를 나열한다. 그림에서 회색 사각형으로 두른 수들이 여기에 해당한다.

//2는 소수이므로 오른쪽에 2를 쓴다. (빨간색)
//자기 자신을 제외한 2의 배수를 모두 지운다.
//남아있는 수 가운데 3은 소수이므로 오른쪽에 3을 쓴다. (초록색)
//자기 자신을 제외한 3의 배수를 모두 지운다.
//남아있는 수 가운데 5는 소수이므로 오른쪽에 5를 쓴다. (파란색)
//자기 자신을 제외한 5의 배수를 모두 지운다.
//남아있는 수 가운데 7은 소수이므로 오른쪽에 7을 쓴다. (노란색)
//자기 자신을 제외한 7의 배수를 모두 지운다.


// 아래 알고리즘은 11^2 > 120까지만 유효
// 강사님 설명대로 해야함..! set 마련해서 없으면 list에 추가 & set에 배수 추가
func eratos(input: Int) -> [Int]
{
    var eratosArray : [Int] = []
    for n in 0..<input
    {
        eratosArray.append(n+1)
    }
    
    var m = 0

    while m < eratosArray.count-1
    {
        if eratosArray[m]%2 == 0 && eratosArray[m] != 2
        {
            eratosArray.remove(at: m)
            m = 0
        }
        else if eratosArray[m]%3 == 0 && eratosArray[m] != 3
        {
            eratosArray.remove(at: m)
            m = 0
        }else if eratosArray[m]%5 == 0 && eratosArray[m] != 5
        {
            eratosArray.remove(at: m)
            m = 0
        }else if eratosArray[m]%7 == 0 && eratosArray[m] != 7
        {
            eratosArray.remove(at: m)
            m = 0
        }else
        {
            m += 1
        }
    }
    
    return eratosArray
}

eratos(input: 122)
