//
//  GameScoreboardEditorViewController.swift
//  MVVMSwiftExample
//
//  Created by Dino Bartosak on 25/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

class GameScoreboardEditorViewController: UIViewController {
  
  @IBOutlet weak var homePlayer1View: PlayerScoreboardMoveEditorView!
  @IBOutlet weak var homePlayer2View: PlayerScoreboardMoveEditorView!
  @IBOutlet weak var homePlayer3View: PlayerScoreboardMoveEditorView!
  
  @IBOutlet weak var awayPlayer1View: PlayerScoreboardMoveEditorView!
  @IBOutlet weak var awayPlayer2View: PlayerScoreboardMoveEditorView!
  @IBOutlet weak var awayPlayer3View: PlayerScoreboardMoveEditorView!
  
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var pauseButton: UIButton!
  
  @IBOutlet weak var homeTeamNameLabel: UILabel!
  @IBOutlet weak var awayTeamNameLabel: UILabel!
  
  @IBOutlet weak var scoreLabel: UILabel!
  
  var viewModel: GameScoreboardEditorViewModel? {
    didSet {
      fillUI()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    styleUI()
    fillUI()
  }
  
  // MARK: Button Action
  
  @IBAction func pauseButtonPress(_ sender: AnyObject) {
    viewModel?.togglePause()
  }
  
  // MARK: Private
  
  fileprivate func styleUI() {
    self.view.backgroundColor = UIColor.backgroundColor
    self.scoreLabel.textColor = UIColor.scoreColor
    self.homeTeamNameLabel.textColor = UIColor.textColor
    self.awayTeamNameLabel.textColor = UIColor.textColor
    self.timeLabel.textColor = UIColor.textColor
  }
  
  // ViewModel의 데이터를 View에 연결하가ㅣ
  fileprivate func fillUI() {
    if !isViewLoaded { return }
    guard let viewModel = viewModel else { return }
    
    self.homeTeamNameLabel.text = viewModel.homeTeam
    self.awayTeamNameLabel.text = viewModel.awayTeam
    self.scoreLabel.text = viewModel.score
    self.timeLabel.text = viewModel.time
    
    let title: String = viewModel.isPaused ? "Start" : "Pause"
    self.pauseButton.setTitle(title, for: .normal)
  }
  
}
