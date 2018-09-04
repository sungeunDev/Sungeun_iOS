//
//  ProblemViewController.swift
//  Anchorage
//
//  Created by Joshua Park on 16/07/2018.
//  Copyright © 2018 Knowre. All rights reserved.
//

import UIKit
import ProblemKit
import KRIndicatorController

/**
 The view controller that displays the problem UI.
 */
class ProblemViewController: UIViewController {
    
    @IBOutlet private var nextPanel: UIView!
    @IBOutlet private var nextButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let problemView = ProblemView.loadFromNib()
    
    var problems: [Problem]?
    var selectedProblemIndex: Int = 0
    var problem: Problem?
    var problemData: ProblemData?
    
    var solvedResult: [(Int, Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchProblem(of: self.selectedProblemIndex)
        
        self.nextPanel.isHidden = true
        problemView.delegate = self
        self.view.addSubview(problemView)
    }
    
    func fetchProblem(of index: Int) {
        beginOperation()
        self.problem = self.problems?[index]
        guard let id = problem?.id else { return }
        DispatchQueue.main.async {
            ProblemLoader.fetchProblem(id: id) { problemData in
                self.problemData = problemData
                self.configuration()
                self.endOperation()
            }
        }
    }
    
    func configuration() {
        guard let problemData = problemData else { return }
        problemView.displayProblem(problemData)
    }
    
    private let indicatorController = IndicatorController()
    
    private func beginOperation() {
        DispatchQueue.main.async {
            self.indicatorController.increment()
        }
        
    }
    
    private func endOperation() {
        DispatchQueue.main.async {
            self.indicatorController.decrement()
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - Private
    
    @IBAction private func nextAction(_ sender: Any) {
        guard let problems = problems else { return }
        if selectedProblemIndex == problems.count - 1 {
            nextButton.setTitle("Done", for: .normal)
            nextPanelReverseAnimation()
            problemView.clearDisplay()
            performSegue(withIdentifier: "backToProblemListVC", sender: self)
        } else {
            selectedProblemIndex += 1
            nextPanelReverseAnimation()
            problemView.clearDisplay()
            fetchProblem(of: selectedProblemIndex)
        }
    }
    
    func nextPanelAnimation() {
        self.nextPanel.isHidden = false
        self.view.bringSubview(toFront: nextPanel)
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseInOut, animations: {
            self.nextPanel.center.y = self.view.frame.height - self.nextPanel.frame.height / 2
        }, completion: nil)
    }
    
    func nextPanelReverseAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.nextPanel.center.y = self.view.frame.height + (self.nextPanel.frame.height / 2)
        }, completion: nil)
    }
}

// MARK: - ProblemViewDelegate
extension ProblemViewController: ProblemViewDelegate {
    func problemView(_ problemView: ProblemView,
                     didSubmitAnswer: String) {
        if didSubmitAnswer.count != 0 {
            guard let id = problem?.id else { return }
            self.beginOperation()
            
            ProblemLoader.checkAnswer(didSubmitAnswer, id: id) { (bool) in
                guard let bool = bool else { return }
                problemView.displayResult(bool)
                self.nextPanelAnimation()
                self.solvedResult.append((self.selectedProblemIndex, bool))
                
                self.endOperation()
                
            }
        }
    }
}
