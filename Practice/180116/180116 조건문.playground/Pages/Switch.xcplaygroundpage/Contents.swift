import Foundation

//Switch 시험점수를 등급으로 반환

func grade(of score: Int) -> String
{
    var testScore: String = "F"
    switch score {
    case 95...100:
        testScore = "A+"
    case 90..<95:
            testScore = "A"
    case 85..<90:
            testScore = "B+"
    case 80..<85:
            testScore = "B"
    case 75..<80:
        testScore = "C+"
    default:
            testScore = "F"
    }
    return testScore
}


//Switch 성적 grade를 point로 변환
func convertPointSwitch(from grade: String) -> Double
{
    var point: Double = 0.0
    switch grade {
    case "A" :
        point = 4.0
    case "B+":
        point = 3.5
    case "B":
        point = 3.0
    case "C+":
        point = 2.5
    default :
        point = 2.0
    }
    return point
}

// 결과물

print(grade(of: 78))
print(convertPointSwitch(from: "B+"))

print(convertPointSwitch(from: grade(of: 92)))
