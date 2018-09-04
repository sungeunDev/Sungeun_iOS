//
//  GameScoreboardEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by sungnni on 2018. 8. 12..
//  Copyright © 2018년 Toptal. All rights reserved.
//

import Foundation

// Protocol
protocol GameScoreboardEditorViewModel {
  var homeTeam: String { get }
  var awayTeam: String { get }
  var time: Dynamic<String> { get }
  var score: Dynamic<String> { get }
  var isFinished: Dynamic<Bool> { get }
  
  var isPaused: Dynamic<Bool> { get }
  func togglePause()
  
  
  // 확장
  // GameScoreBoardEditorVC는 PlayerScoreboardMoveEditorView의 부모 뷰이기 때문에 PlayerScoreboardMoveEditerViewModel 객체를 생성해야 함.
  var homePlayer: [PlayerScoreboardMoveEditorViewModel] { get }
  var awayPlayer: [PlayerScoreboardMoveEditorViewModel] { get }
}
