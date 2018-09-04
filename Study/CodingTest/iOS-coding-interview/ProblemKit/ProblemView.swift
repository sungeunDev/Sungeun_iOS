//
//  ProblemView.swift
//  ProblemKit
//
//  Created by Joshua Park on 16/07/2018.
//  Copyright © 2018 Knowre. All rights reserved.
//

import UIKit

@objc public protocol ProblemViewDelegate {
    
    func problemView(_ problemView: ProblemView,
                     didSubmitAnswer: String)
    
}

public class ProblemView: UIView {
    
    /// A factory method to instantiate a `ProblemView` object
    /// from the Interface Builder.
    public class func loadFromNib() -> ProblemView {
        let bundle = Bundle(for: ProblemView.self),
        nib    = bundle.loadNibNamed("ProblemView", owner: nil, options: nil)!
        
        return nib[0] as! ProblemView
    }
    
    @IBOutlet public weak var delegate: ProblemViewDelegate?
    
    @IBOutlet private var problemLabel: UILabel!
    
    @IBOutlet private var textField: UITextField!
    
    @IBOutlet private var submitButton: UIButton!
    
    @IBOutlet private var resultImageView: UIImageView!
    
    // MARK: - Public
    
    /**
     Displays the problem on view.
     
     - Parameter problem: The problem data to display.
     */
    public func displayProblem(_ problem: ProblemData) {
        problemLabel.text = problem.problem
    }
    
    public func clearDisplay() {
        problemLabel.text = ""
        textField.text = ""
        submitButton.isUserInteractionEnabled = false
        submitButton.backgroundColor = .gray
        resultImageView.image = nil
    }
    
    /**
     Displays the result on view.
     
     - Parameter result: The result of solving the problem.
     */
    public func displayResult(_ result: Bool) {
        if result {
            resultImageView.image = UIImage(named: "correct", in: Bundle(for: type(of: self)), compatibleWith: nil)
        } else {
            resultImageView.image = UIImage(named: "incorrect", in: Bundle(for: type(of: self)), compatibleWith: nil)
        }
        
    }
    
    // MARK: - Private
    
    @IBAction private func submitAction(_ sender: Any) {
        assert(textField.text != nil)
        delegate?.problemView(self, didSubmitAnswer: textField.text!)
    }
}

extension ProblemView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if !text.isEmpty{
            submitButton.backgroundColor = UIColor(red: 57/255, green: 213/255, blue: 121/255, alpha: 1)
            submitButton.isUserInteractionEnabled = true
        } else {
            submitButton.backgroundColor = .gray
            submitButton.isUserInteractionEnabled = false
        }
        return true
    }
}
