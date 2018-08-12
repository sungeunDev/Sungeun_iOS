//
//  GameScoreboardEditorViewModelFromGame.swift
//  MVVMSwiftExample
//
//  Created by sungnni on 2018. 8. 12..
//  Copyright © 2018년 Toptal. All rights reserved.
//

import Foundation

class GameScoreboardEditorViewModelFromGame: NSObject, GameScoreboardEditorViewModel { // NSObject의 서브클래스이고, Protocol을 준수함
  // Game 모델에서 데이터를 가져오는 ViewModel을 프로토콜로 만들고,
  // 프로토콜에 대한 구현을 생성
  // 프로토콜로 만들면, 사용할 데이터를 정의해주기만 하면 되기 때문에 명확하게 만들 수 있음.
  
  let game: Game // 게임 모델을 이용 & 가공해서 뷰에 표현하는 문자열 등을 만들어줌.
  
  struct Formatter {
    static let durationFormatter: DateComponentsFormatter = {
      let dateFormatter = DateComponentsFormatter()
      dateFormatter.unitsStyle = .positional
      return dateFormatter
    }()
  }
  
  // MARK: GameScoreboardEditorViewModel protocol
  var homeTeam: String
  var awayTeam: String
  
  var time: String
  var score: String
  var isFinished: Bool
  
  var isPaused: Bool
  func togglePause() {
    if isPaused {
      startTimer()
    } else {
      pauseTimer()
    }
    
    self.isPaused = !isPaused
  }
  
  // MARK:  Init
  
  init(withGame game: Game) {
    self.game = game
    
    self.homeTeam = game.homeTeam.name
    self.awayTeam = game.awayTeam.name
    
    self.time = GameScoreboardEditorViewModelFromGame.timeRemainingPretty(for: game)
    self.score = GameScoreboardEditorViewModelFromGame.scorePretty(for: game)
    self.isFinished = game.isFinished
    self.isPaused = true
  }
  
  // MARK:  Private
  
  /***************************************************
  << Timer >>
   
  특정 시간 간격이 지난 후 지정된 메세지를 대상 개체에게 보내어 지연 실행 합니다.
  (https://devminjun.github.io/blog/Timer,Thread / https://developer.apple.com/documentation/foundation/timer)
  TimeInterval은 double의 typealias. Timer에서는 지연하는 시간을 의미.
  (https://developer.apple.com/documentation/foundation/timeinterval)
   ***************************************************/
  
  fileprivate var gameTimer: Timer? // NSObject
  fileprivate func startTimer() {
    let interval: TimeInterval = 0.001
    gameTimer = Timer.schedule(repeatInterval: interval, handler: { (timer) in
      self.game.time += interval
      self.time = GameScoreboardEditorViewModelFromGame.timeRemainingPretty(for: self.game)
    })
  }
  
  fileprivate func pauseTimer() {
    gameTimer?.invalidate()
    gameTimer = nil
  }
  
  // MARK:  String Utils
  // 정돈된 문자열을 받기 위한 함수들
  fileprivate static func timeFormatted(totalMills: Int) -> String {
    let mills: Int = totalMills % 1000 / 100
    let totalSeconds: Int = totalMills / 1000
    
    let seconds: Int = totalSeconds % 60
    let minutes: Int = totalSeconds / 60
    
    /***************************************************
     String.init(format: String, _ arguments: CVarArg...)
     - 지정된 형식 캐릭터 라인을 템플릿으로서 사용해 초기화되어,
     나머지의 인수가 치환되는 String 오브젝트를 돌려줍니다.
     
     - 숫자를 문자열로 두자리수로 나타내는 방법 중 하나.
     (https://code.i-harness.com/ko/q/1861d75)
     ***************************************************/
    return String(format: "%02d:%02d.%d", minutes, seconds, mills)
  }
  
  fileprivate static func timeRemainingPretty(for game: Game) -> String {
    return timeFormatted(totalMills: Int(game.time * 1000))
  }
  
  fileprivate static func scorePretty(for game: Game) -> String {
    
    // 둘이 뭐가 다른거? 테스트 코드 >> 다른거 없음!
//    print("\n---------- [ GameScoreboardEditorViewModelFromGame Class - scorePretty(for:) ] -----------\n")
//    print(String(format: "\(game.homeTeamScore) - \(game.awayTeamScore)"))
//    print("\(game.homeTeamScore) - \(game.awayTeamScore)")
    
    return String(format: "\(game.homeTeamScore) - \(game.awayTeamScore)")
  }
}
