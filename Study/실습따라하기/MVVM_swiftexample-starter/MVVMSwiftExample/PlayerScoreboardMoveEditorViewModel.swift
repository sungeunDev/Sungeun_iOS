//
//  PlayerScoreboardMoveEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by sungnni on 2018. 8. 24..
//  Copyright © 2018년 Toptal. All rights reserved.
//

import Foundation

protocol PlayerScoreboardMoveEditorViewModel {
  
  var playerName: String { get }
  
  var onePointMoveCount: Dynamic<String> { get }
  var twoPointMoveCount: Dynamic<String> { get }
  var assistMoveCount: Dynamic<String> { get }
  var reboundMoveCount: Dynamic<String> { get }
  var foulMoveCount: Dynamic<String> { get }
  
  func onePointMove()
  func twoPointMove()
  func assistMove()
  func reboundMove()
  func foulMove()
}
