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



