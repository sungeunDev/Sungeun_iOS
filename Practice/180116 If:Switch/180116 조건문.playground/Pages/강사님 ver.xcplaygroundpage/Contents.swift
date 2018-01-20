import Foundation

// 윤년구하기
func isLeapYear(_ year: Int) -> Bool
{
    if year%400 == 0 || (year%4 == 0 && year%100 != 0)
    {
            return true
    }else
    {
        return false
    }
}


//여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수

func average(of aGrade:String, and bGrade:String, then cGrade:String) -> Double
{
    let sumPoint = point(of: aGrade) + point(of: bGrade) + point(of: cGrade)
    let averagePoint = sumPoint / 3
    return averagePoint
}

func point(of grade: String) -> Double
{
    switch grade {
    case "A+":
        return 4.5
    case "A":
        return 4.0
    case "B+":
        return 3.5
    case "B":
        return 3.0
    default:
        return 2.5
    }
}

print(average(of: "B", and: "D", then: "A+"))



//2. 년/월을 입력받아 해당 들의 마지막 날을 반환 해주는 함수(윤년 고려)

/// 월의 마지막 날을 구하는 함수
///
/// - Parameters:
///   - month: 구하려는 달
///   - year: 2월일 경우 윤년 계산을 위해 필요한 데이터
/// - Returns: 마지막 날
func lastDay(of month: Int, year: Int) -> Int
{
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        return 31
    case 4, 6, 9, 11:
        return 30
    case 2:
        let lastDayofFeb = isLeapYear(year) ? 29 : 28
        return lastDayofFeb
    default:
        return 0
    }
}

print(lastDay(of: 13, year: 2012))

