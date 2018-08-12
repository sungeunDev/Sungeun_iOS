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
  var time: String { get }
  var score: String { get }
  var isFinished: Bool { get }
  
  var isPaused: Bool { get }
  func togglePause()
}
