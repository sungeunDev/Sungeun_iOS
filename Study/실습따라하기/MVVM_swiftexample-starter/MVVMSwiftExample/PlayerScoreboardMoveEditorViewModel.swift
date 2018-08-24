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
  
  var onePointMoveCount: String { get }
  var twoPointMoveCount: String { get }
  var assistMoveCount: String { get }
  var reboundMoveCount: String { get }
  var foulMoveCount: String { get }
  
  func onePointMove()
  func twoPointMove()
  func assistMove()
  func reboundMove()
  func foulMove()
}
