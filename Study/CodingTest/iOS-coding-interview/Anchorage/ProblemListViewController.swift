//
//  ProblemListViewController.swift
//  Anchorage
//
//  Created by Joshua Park on 16/07/2018.
//  Copyright © 2018 Knowre. All rights reserved.
//
import UIKit

/**
 The initially displayed view controller when launching `Anchorage`.
 */
class ProblemListViewController: UIViewController {
    
    @IBOutlet private var button1: UIButton!
    @IBOutlet private var button2: UIButton!
    @IBOutlet private var button3: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var lesson: Lesson? {
        willSet {
            collectionView.reloadData()
        }
    }
    
    var solvedResult: [(Int, Bool)]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.backgroundColor = UIColor.notSolve
        button2.backgroundColor = UIColor.notSolve
        button3.backgroundColor = UIColor.notSolve
        
        fetchLesson { (lesson) in
            self.lesson = lesson
        }
    }
    
    @IBAction private func buttonsAction(_ sender: Any) {
        performSegue(withIdentifier: "goToProblemVC", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let problemVC = segue.destination as? ProblemViewController else { return }
        if segue.identifier == "goToProblemVC" {
            let senderButton = sender as! UIButton
            guard let lesson = lesson else { return }
            
            let problem: Problem = lesson.problems[senderButton.tag] // 스토리보드를 통해 버튼에 태그 설정

            problemVC.problems = lesson.problems
            problemVC.selectedProblemIndex = senderButton.tag
            problemVC.title = "\(lesson.id)-\(problem.id)"
        }
    }
    
    @IBAction private func didUnwindFromFilterVC(_ sender: UIStoryboardSegue) {
        guard let problemVC = sender.source as? ProblemViewController,
            sender.identifier == "backToProblemListVC" else { return }
        self.solvedResult = problemVC.solvedResult
        for result in problemVC.solvedResult {
            switch result.0 {
            case 0:
                button1.backgroundColor = UIColor.backgroundColor(of: result.1)
            case 1:
                button2.backgroundColor = UIColor.backgroundColor(of: result.1)
            case 2:
                button3.backgroundColor = UIColor.backgroundColor(of: result.1)
            default:
                print("other tag")
            }
        }
    }
    

    private func fetchLesson(completion: @escaping (Lesson) -> Void) {
        // Assume data is asynchronously downloaded from a remote server.
        
        simulateHTTPRequest { (data) in
            // TODO: Convert data to lesson object
            let lesson = try! JSONDecoder().decode(Lesson.self, from: data)
            completion(lesson)
        }
    }
    
    private func simulateHTTPRequest(_ completion: @escaping (Data) -> Void) {
        let url  = Bundle.main.url(forResource: "lesson2",
                                   withExtension: "json")!,
        data = try! Data(contentsOf: url)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
        {
            completion(data)
        }
    }
}

extension UIColor {
    static let notSolve = UIColor(hex: "DBDBDB")
    static let correct = UIColor(hex: "86D750")
    static let incorrect = UIColor(hex: "D30023")
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    static func backgroundColor(of answer: Bool) -> UIColor {
        if answer {
            return self.correct
        } else {
            return self.incorrect
        }
    }
}

// MARK: - UICollectionView DataSource & Delegate
extension ProblemListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lesson?.problems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "problemsCell", for: indexPath) as! ProblemsCell
        cell.problemLabel.text = "\(indexPath.item + 1)"
        
        // 과제2 - 요구사항 2
        guard let solvedResult = solvedResult else { return cell }
        for result in solvedResult {
            if result.0 == indexPath.item {
                cell.backgroundColor = UIColor.backgroundColor(of: result.1)
            }
        }
        return cell
    }
}


class ProblemsCell: UICollectionViewCell {
    @IBOutlet weak var problemLabel: UILabel!
}
