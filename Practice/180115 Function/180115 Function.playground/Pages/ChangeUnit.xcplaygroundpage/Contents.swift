import Foundation

// 1. inch to cm, cm to inch

func inch(switch cm: Int) -> Double
{
    return Double(cm) * 2.54
}

func cm(switch inch:Int) -> String
{
    return String(format: "%.2f", Double(inch) / 2.54)
}

print("1인치 = \(inch(switch: 1))cm")
print("1센치 = \(cm(switch: 1))in")


// 2. m^2 to 평, 평 to m^2

func meter(to pyung: Int) -> Double
{
    let convertPyung: Double = Double(pyung) * 0.3025
    return convertPyung
}

func pyung(to meter: Int) -> Double
{
    let convertMeter: Double = 3.305785 * Double(meter)
    return convertMeter
}

print("1제곱미터 = \(meter(to: 1))평")
print("1평 = \(pyung(to: 1))제곱미터")

//3. 화씨 <-> 섭씨

func changeTemperatureF(to C: Int) -> Double
{
    let convertC = -17.222222 * Double(C)
    return convertC
}

func changeTemperatureC(to F: Int) -> Double
{
    let convertF = 33.8 * Double(F)
    return convertF
}

print("1섭씨(C) = \(changeTemperatureC(to: 1))F")
print("1화씨(F) = \(changeTemperatureF(to: 1))C")


// 4. KB to MB, MB to GB
// 1024KB = 1MB

// if문 이용
func dataIf(switch kb:Int) -> String
{
    let mb: Double = Double(kb) / 1024
    let gb: Double = mb / 1024
    
    if kb<1024
    {
        return "\(kb)KB"
    }
    
    else if kb < 1048576
    {
        return ("\(String(format:"%.2f", mb))MB")
    }
        
    else
    {
        return ("\(String(format:"%.2f", gb))GB")
    }
}

print("if문 이용")
print(dataIf(switch: 4048))
print(dataIf(switch: 40480000))


//swith문 이용
func dataSwitch(switch kb:Int) -> String
{
    switch kb {
    case 0..<1024:
        return "\(kb)KB"
        
    case 1024..<1048576:
        let mb: Double = Double(kb) / 1024
        return ("\(String(format:"%.2f", mb))MB")
    
    default:
        let gb: Double = Double(kb) / 1024 / 1024
        return ("\(String(format:"%.2f", gb))GB")
    }
}

print("switch문 이용")
print(dataSwitch(switch: 9096))
print(dataSwitch(switch: 90960000))



// 5. 시간을 받아서 초 단위로 변경하는 함수
// hh mm ss
// 강사님이랑 같이 진행. 나중에 혼자서 짜볼 것.

func changeToSecond(from time: Int) -> Int
{
    // 시간을 100으로 나눠서 몫, 나머지로 분리
    var remainTime: Int = time
    
    // % : 나머지 구하는 연산자
    let second:Int = remainTime % 100
    remainTime = remainTime / 100
    
    let min: Int = remainTime % 100
    remainTime = remainTime / 100
    
    let hour: Int = remainTime % 100
    remainTime = remainTime / 100
    
    return (hour * 3600 + min * 60 + second)
}

print("\(changeToSecond(from: 132350))초")



func changeSecond(from time: Int)
{
    let s = "Swift"
    let i = s.index(s.startIndex, offsetBy: 2)
    print(s[i])
    // Prints "t"
    
    let timeStr = String(time)
    let second = timeStr.index(timeStr.startIndex, offsetBy: 3)
    print(timeStr[second])
}
//
//    let secondOffset: String = secondStr.index(secondStr.startIndex, offsetBy: 4)
//
//    let hourTemp = secondStr.index(secondStr.endIndex, offsetBy: -5)
//    let hour = secondStr(hourTemp)
//
//    let minuteTemp = secondStr.index(secondStr.startIndex, offsetBy: 2)
//    let minute = secondStr.index(secondStr.endIndex, offsetBy: -3)
//
//    let secondSum = int(minute)
//    return

print(changeSecond(from: 123456))


let secondStr = "123456"

let startIndex = secondStr.index(secondStr.startIndex, offsetBy: 2)
let endIndex = secondStr.index(secondStr.endIndex, offsetBy:-1)


let substring1: Substring = secondStr[startIndex...endIndex]

let resultStr:String = String(substring1)
let resultInt:Int! = Int(resultStr)

let plus = Int(resultInt) + Int(resultInt)

print(plus)

