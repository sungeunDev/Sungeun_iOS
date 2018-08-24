import Foundation

//Logic
func isPossibleTime(patterns: [UInt32], compare date: Date? = Date()) -> Bool {
  guard let date = date else { return false }
  let calendar = Calendar(identifier: .gregorian)
  let currentWeekDay = calendar.component(.weekday, from: date)
  for pattern in patterns {
    let strPattern = String(pattern, radix: 2)
    let isEqualWeekday = strPattern[strPattern.index(strPattern.startIndex, offsetBy: currentWeekDay)]
    if isEqualWeekday == "1" {
      let currentHour = calendar.component(.hour, from: date)
      let isEqualHour = strPattern[strPattern.index(strPattern.startIndex, offsetBy: (8 + currentHour))]
      if isEqualHour == "1" {
        return true
      }
    }
  }
  return false
}

//Helper - input type converter
func patternConverted(from strs: String, compare date: String? = nil) -> ([UInt32], Date?) {
  let strs: [String] = strs.components(separatedBy: ".")
  let date: Date? = dateConverter(str: date)
  
  var timePatterns: [UInt32] = []
  for str in strs {
    let array = str.components(separatedBy: " ")
    var weekday: [Int] = []
    let weekDayData = ["일", "월", "화", "수", "목", "금", "토"]
    
    for (idx, dayData) in weekDayData.enumerated() {
      for j in array[0].components(separatedBy: ",") {
        if dayData == j {
          weekday.append(idx)
        }
      }
    }
    
    let timeArray = array[1].components(separatedBy: "~")
    let startTime = Int(timeArray[0].components(separatedBy: ":")[0])! // ?? 0 등등.
    let endTime = 24 - Int(timeArray[1].components(separatedBy: ":")[0])!
    
    let baseUint: UInt32 = 0b10000000000000000000000000000000 // 맨 처음 1은 비트 개수 유지를 위함. // 0b1 << 32
    var weekdayUintTime: UInt32 = baseUint // 맨 처음 1을 제외한 앞 7개는 요일(일~월)을 의미
    for weekdayData in weekday {
      weekdayUintTime = (baseUint >> Int(weekdayData + 1)) | weekdayUintTime
    }
    // 비트의 뒤부터 24자리 수는 시간(00시~24시)를 의미
    let startUint = (0b00000000111111111111111111111111 >> startTime) | baseUint
    let endUint = (0b00000000111111111111111111111111 << endTime) | baseUint
    
    let resultUint = weekdayUintTime | (startUint & endUint)
    timePatterns.append(resultUint)
  }
  if let date = date {
    return (timePatterns, date)
  } else {
    return (timePatterns, Date())
  }
  
}

func dateConverter(str: String?) -> Date? {
  guard let str = str else { return Date() }
  let dateformatter = DateFormatter()
  dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
  dateformatter.locale = Locale.init(identifier: "ko-KR")
  return dateformatter.date(from: str)
}

//Main
let cases = Int(readLine()!)!
for _ in 0..<cases {
  let testArray = String(readLine()!)
  let arr: [String] = testArray.components(separatedBy: "/")
  if arr.count == 2 {
    let pattenTemp = patternConverted(from: arr[0], compare: arr[1])
    print(isPossibleTime(patterns: pattenTemp.0, compare: pattenTemp.1)) // in -, at -
  } else {
    let pattenTemp = patternConverted(from: arr[0])
    print(isPossibleTime(patterns: pattenTemp.0))
  }
}
