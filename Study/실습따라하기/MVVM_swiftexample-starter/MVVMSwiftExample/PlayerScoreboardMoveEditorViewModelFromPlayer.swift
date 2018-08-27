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
  
  var onePointMoveCount: Dynamic<String>
  var twoPointMoveCount: Dynamic<String>
  var assistMoveCount: Dynamic<String>
  var reboundMoveCount: Dynamic<String>
  var foulMoveCount: Dynamic<String>
  
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
    self.onePointMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .onePoint))")
    self.twoPointMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .twoPoints))")
    self.assistMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .assist))")
    self.reboundMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .rebound))")
    self.foulMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .foul))")
  }
  
  // MARK: Private
  // Why Private?
  
  fileprivate func makeMove(_ move: PlayerInGameMove) {
    game.addPlayerMove(move, for: player)
    
    onePointMoveCount.value = "\(game.playerMoveCount(for: player, move: .onePoint))"
    twoPointMoveCount.value = "\(game.playerMoveCount(for: player, move: .twoPoints))"
    assistMoveCount.value = "\(game.playerMoveCount(for: player, move: .assist))"
    reboundMoveCount.value = "\(game.playerMoveCount(for: player, move: .rebound))"
    foulMoveCount.value = "\(game.playerMoveCount(for: player, move: .foul))"
  }
}
