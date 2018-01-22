import Foundation

/* 결과 확인
 #룰 : S는 결과에 포함되고 자릿수 가 같은,
 B은 결과에 포함은 됐지만 자릿수가 같지 않음.
 O은 결과에 포함도 되지 않음
 #로직 :  레이블의 숫자를 하나씩 가져와서 결과에 포함되어 있는지 확인, 그리고 자리수가 같은지 다시한번 확인
 */


private func checkAnswer(answer:[Int], correctAnswer:[Int]) -> String
{
    var strikeCount:Int = 0
    var ballCount:Int = 0
    var outCount:Int = 0
    
    //카운트 구하기
    //사용자가 말한 answer와 정답인 리스트 두개의 리스트를 비교해서
    //스트라이크, 볼, 아웃 카운트 정하기
    
    var m = 0
    var n = 0
    while m < 3
    {
        while n < 3
        {
        if answer[m] == correctAnswer[n]
        {
            if m == n
            {
                strikeCount += 1
            }else
            {
                ballCount += 1
            }
        }
            n += 1
        }
        m += 1
        n = 0
    }
    outCount = 3 - (strikeCount + ballCount)
    
    //make result Str
    var resultStr:String = ""
    if strikeCount > 0
    {
        resultStr += "\(strikeCount)S "
    }
    
    if ballCount > 0
    {
        resultStr += "\(ballCount)B "
    }
    
    if outCount > 0
    {
        resultStr += "\(outCount)O "
    }
    
    return resultStr
}

checkAnswer(answer: [7, 3, 9], correctAnswer: [1, 3, 7])
