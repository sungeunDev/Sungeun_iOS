//
//  PlayerScoreboardMoveEditorViewModelFromPlayer.swift
//  MVVMSwiftExample
//
//  Created by sungnni on 2018. 8. 24..
//  Copyright © 2018년 Toptal. All rights reserved.
//

import Foundation

class PlayerScoreboardMoveEditorViewModelFromPlayer: NSObject, PlayerScoreboardMoveEditorViewModel {
  
  fileprivate let player: Player
  fileprivate let game: Game
  
  // MARK: PlayerScoreboardMoveEditorViewModel protocol
  
  var playerName: String
  
  var onePointMoveCount: String
  var twoPointMoveCount: String
  var assistMoveCount: String
  var reboundMoveCount: String
  var foulMoveCount: String
  
  func onePointMove() {
    makeMove(.onePoint)
  }
  
  func twoPointMove() {
    makeMove(.twoPoints)
  }
  
  func assistMove() {
    makeMove(.assist)
  }
  
  func reboundMove() {
    makeMove(.rebound)
  }
  
  func foulMove() {
    makeMove(.foul)
  }
  
  // MARK: Init
  init(withGame game: Game, player: Player) {
    self.game = game
    self.player = player
    
    self.playerName = player.name
    self.onePointMoveCount = "\(game.playerMoveCount(for: player, move: .onePoint))"
    self.twoPointMoveCount = "\(game.playerMoveCount(for: player, move: .twoPoints))"
    self.assistMoveCount = "\(game.playerMoveCount(for: player, move: .assist))"
    self.reboundMoveCount = "\(game.playerMoveCount(for: player, move: .rebound))"
    self.foulMoveCount = "\(game.playerMoveCount(for: player, move: .foul))"
  }
  
  // MARK: Private
  // Why Private?
  
  fileprivate func makeMove(_ move: PlayerInGameMove) {
    game.addPlayerMove(move, for: player)
    
    onePointMoveCount = "\(game.playerMoveCount(for: player, move: .onePoint))"
    twoPointMoveCount = "\(game.playerMoveCount(for: player, move: .twoPoints))"
    assistMoveCount = "\(game.playerMoveCount(for: player, move: .assist))"
    reboundMoveCount = "\(game.playerMoveCount(for: player, move: .rebound))"
    foulMoveCount = "\(game.playerMoveCount(for: player, move: .foul))"
  }
}
