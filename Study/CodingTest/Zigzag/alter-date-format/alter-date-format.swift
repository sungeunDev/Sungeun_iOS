import Foundation

//Logic
func alterDateFormat(time: String, n: Int) -> String {
  var arr = time.components(separatedBy: [" ", ":"])
  if arr[0] == "PM" {
    arr[1] = String(Int(arr[1])! + 12)
  } else if arr[0] == "AM" && arr[1] == "12" {
    arr[1] = String(Int(arr[1])! - 12)
  }
  
  guard var hour = Int(arr[1]),
    var min = Int(arr[2]),
    var sec = Int(arr[3]) else { return "type casting fail" }
  
  let totalSecond = (hour * 60 + min) * 60 + sec + n
  sec = totalSecond % 60
  min = (totalSecond / 60) % 60
  hour = totalSecond / 60 / 60
  
  while hour >= 24 {
    hour -= 24
  }
  return "\(convertString(hour)):\(convertString(min)):\(convertString(sec))"
}

func convertString(_ num: Int) -> String {
  if num < 10 {
    return "0\(num)"
  } else {
    return "\(num)"
  }
}

//Main
let cases = Int(readLine()!)!
for _ in 1...cases {
  let time: String = String(readLine()!)
  let n: Int = Int(readLine()!)!
  print(alterDateFormat(time: time, n: n))
}
