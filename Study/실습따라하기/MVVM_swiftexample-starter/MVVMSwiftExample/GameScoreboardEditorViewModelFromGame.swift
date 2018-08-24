//
//  GameScoreboardEditorViewModelFromGame.swift
//  MVVMSwiftExample
//
//  Created by sungnni on 2018. 8. 12..
//  Copyright © 2018년 Toptal. All rights reserved.
//

import Foundation

class GameScoreboardEditorViewModelFromGame: NSObject, GameScoreboardEditorViewModel {
  /***************************************************
   < NSObject > [공식문서]
   The root class of most Objective-C class hierarchies,
   from which subclasses inherit a basic interface to the runtime system and the ability to behave as Objective-C objects.
   
   < NSObject 의 생명주기 >
   - iOS의 모든 객체는 NSObject에 정의된대로 생명주기를 갖습니다.
   - 기본적으로는 메모리에 생성될 때 alloc, 메모리에서 해제될 때 dealloc 메소드를 시스템에서 호출합니다.
   - alloc 과 dealloc 메소드를 재정의 한다면 언제 메모시레 생성되고 해제되었는지 알 수 있으며, 적절한 처리도 해 줄 수 있습니다.
   출처: http://adervise1.tistory.com/16 [하늘의 가치]
   
   AnyObject는 클래스의 일종으로서 Objective에서 사용하던 NSObject와 같은 역할이라고 볼 수 있다.
   이 클래스는 클래스 타입에 상관없이 모든 종류의 클래스 타입을 저장할 수 있는 범용타입의 클래스이다.
   가장 추상화된 클래스이며, 상속관계가 직접 성립하는 것은 아니지만 가장 상위의 클래스라고 할 수 있다.
   출처: https://github.com/baecheese/ios_study/issues/1 [Anyobject란 무엇인가?]
   
   -부모 클래스가 없는 루트 클래스인 NSObject는 Objective-C의 객체들을 위한 기본 프레임워크로, 객체 사이의 상호 작용을 정의한다.
   그래서 이를 상속하는 클래스가 객체로 동작하게 하고, 런타임 시스템과 상호동작할수 있도록 해준다.
   다른 클래스와 특별한 연관관계가 없는 클래스도 그것을 생성할 때는 반드시 NSObject를 상속해야한다.
   클래스의 인스턴스들이 실행될 때 최소한 Objective-C의 객체로서 동작할 수 있어야 하기 때문에 클래스를 새로 설계할 때 NSObject를 기본적으로 상속해야 함을 절대로 잊지말자.
   만일 아무런 클래스도 상속하지 않는 독자적인 클래스를 만들게 되면 이 클래스는 Objective-C의 객체가 가져야 하는 기본적인 성질들을 가질 수 없게 된다.
   출처: http://comxp.tistory.com/232 [까칠하게...]
   
   -> 가장 루트 클래스인 NSObject를 상속함으로써 객체가 가져야 하는 기본적인 성질을 부여.
   ***************************************************/
  
  // NSObject의 서브클래스이고, Protocol을 준수함
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
  
  var homePlayer: [PlayerScoreboardMoveEditorViewModel]
  var awayPlayer: [PlayerScoreboardMoveEditorViewModel]
  
  // MARK:  Init
  
  init(withGame game: Game) {
    self.game = game
    
    self.homeTeam = game.homeTeam.name
    self.awayTeam = game.awayTeam.name
    
    self.time = GameScoreboardEditorViewModelFromGame.timeRemainingPretty(for: game)
    self.score = GameScoreboardEditorViewModelFromGame.scorePretty(for: game)
    self.isFinished = game.isFinished
    self.isPaused = true
    
    self.homePlayer = GameScoreboardEditorViewModelFromGame.playerViewModels(from: game.homeTeam.players, game: game)
    self.awayPlayer = GameScoreboardEditorViewModelFromGame.playerViewModels(from: game.awayTeam.players, game: game)
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
  
  // MARK: Private Init
  fileprivate static func playerViewModels(from players: [Player], game: Game) -> [PlayerScoreboardMoveEditorViewModel] {
    var playerViewModels: [PlayerScoreboardMoveEditorViewModel] = [PlayerScoreboardMoveEditorViewModel]()
    for player in players {
      playerViewModels.append(PlayerScoreboardMoveEditorViewModelFromPlayer(withGame: game, player: player))
    }
    return playerViewModels
  }
}
