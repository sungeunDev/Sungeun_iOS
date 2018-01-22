import Foundation

private func addHistory(answer:[Int], score:String)
{
    //answer -> Int로 변경하기
    //밑에 문제를 해결후 주석 풀어 주세요
            let answerStr = changeStrFrom(list:answer)
            let text = answerStr + "의 결과 값은 \(score)입니다."
    
    //저장
            historyText += text + "\n"
            historyTextView.text = historyText
}

//배열의 내용을 스트링으로 변환 해주는 함수
//ex : input [1,2,3] output "123"

 func changeStrFrom(list:[Int]) -> String
 {
    var sum: String = ""
    for n in 0...2
    {
        var sumTemp = ""
        sumTemp = String(list[n])
        sum += sumTemp
        print(n)
    }
    return sum
 }
