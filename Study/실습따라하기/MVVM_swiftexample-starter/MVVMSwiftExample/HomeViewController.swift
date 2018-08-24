//
//  HomeViewController.swift
//  MVVMSwiftExample
//
//  Created by Dino Bartosak on 25/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var gameLibrary: GameLibrary? {
    didSet {
      showGameScoreboardEditorViewController()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    showGameScoreboardEditorViewController()
  }
  
  // MARK: Private
  
  fileprivate func showGameScoreboardEditorViewController() {
    if !self.isViewLoaded { return }
    guard let gameLibrary = gameLibrary else { return }
    
    if let game = gameLibrary.allGames().first { // game은 gameLibrary 중 첫번째 게임을 가져옴
      // controller = GameScoreboardEditorViewController
      let controller = UIStoryboard.loadGameScoreboardEditorViewController()
      
      // 컨트롤러의 뷰모델에 데이터 넣기
      let viewModel = GameScoreboardEditorViewModelFromGame(withGame: game)
      controller.viewModel = viewModel
      
      // HomeViewController에서 GameScoreboardEditorViewController 띄우기
      self.insertChildController(controller, intoParentView: self.view)
    }
  }
}


