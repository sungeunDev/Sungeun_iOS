//
//  ViewController.swift
//  SlackAddWorkspacesUI
//
//  Created by giftbot on 2018. 3. 16..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

final class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: Properties
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var dismissButton: UIButton!
    @IBOutlet private weak var urlTextField: UITextField!
    @IBOutlet private weak var placeholderLabel: UILabel!
    
    @IBOutlet weak var yourslackLbConstraint: NSLayoutConstraint!
    
    // Constraints
    @IBOutlet private weak var placeholderLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var dontKnowURLLabelBottomConstraint: NSLayoutConstraint!
    
    // Segue Identifier
    private let nextVCModalSegue = "NextViewControllerModalSegue"
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Gesture
        let taps = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        self.view.addGestureRecognizer(taps)
        
        // 오토 레이아웃 적용될때마다 자동으로 불리기 때문에 호출 안해줘도 됨.
        //    updateViewConstraints()
        
        // 오토레이아웃을 100% 코드로 짤 경우, 아래 호출해줘야 레이아웃 적용됨.
        //        view.updateConstraintsIfNeeded()
    }
    
    
    // view 탭하면 키보드 사라지게 하기
    @objc func tapAction(_ sender: UIGestureRecognizer) {
        urlTextField.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        urlTextField.becomeFirstResponder()
        addKeyboardObserver()
    }
    
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: .main) {
            // capture 이용
            [weak self] in
            
            guard let userInfo = $0.userInfo,
                let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
                let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
                else { return }
            
            // keyboard animate
            UIView.animate(
                withDuration: duration, delay: 0,
                options: UIViewAnimationOptions(rawValue: curve),
                animations: { [weak self] in
                    self?.dontKnowURLLabelBottomConstraint.constant = keyboardFrame.height + 30
                    self?.yourslackLbConstraint.constant = -100
                    self?.view.layoutIfNeeded()
            })
        }
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: .main) {
            [weak self] in
            guard let userInfo = $0.userInfo,
                let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
                let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
                else { return }
            
            UIView.animate(
                withDuration: duration, delay: 0,
                options: UIViewAnimationOptions(rawValue: curve),
                animations: { [weak self] in
                    self?.dontKnowURLLabelBottomConstraint.constant = 20
                    self?.yourslackLbConstraint.constant = -50
                    self?.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 등록한 옵저버 해제해줘야 크러쉬 안남.
        NotificationCenter.default.removeObserver(self)
    }
    
    private var didUpdateConstraints = false
    
    // 반복해서 불림.
    override func updateViewConstraints() {
        // 한번만 적용하면 되는 내용에 대해서는 Bool type 변수를 이용해서 더이상 호출되지 않도록 함.
        if !didUpdateConstraints {
            didUpdateConstraints = true
            
            // view에 subview가 연결됐을 때, 자동으로 서브뷰들의 크기를 자동으로 조절해주는 기능이 있는데, true로 적용할 경우 autolayout 적용이 안됨.
            // autolayout을 이용할 경우, 이 기능을 false로 적용해줘야 둘 중에 하나만 적용할 수 있음.
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            dismissButton.translatesAutoresizingMaskIntoConstraints = false
            
            //            NSLayoutConstraint(item: nextButton, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            nextButton.trailingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
                .isActive = true
            //            view.safeAreaLayoutGuide.trailingAnchor
            //                .constraint(equalTo: nextButton.trailingAnchor, constant: 16)
            
            
            dismissButton.leadingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
            dismissButton.centerYAnchor
                .constraint(equalTo: nextButton.centerYAnchor).isActive = true
        }
        
        // super는 가장 나중에 호출됨. 왜 그런지는 헤더 읽어보세요!
        super.updateViewConstraints()
    }
    
    
    @IBAction private func dismissBtn(_ sender: UIButton) {
        urlTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
    // 코드로 언더라인 Attribute 주기
    private func underlineStyleByProgrammaticallyExample() {
        let buttonTitle = nextButton.title(for: .normal)!
        let mutableAttrStr = NSMutableAttributedString(string: buttonTitle)
        let attrkeys: [NSAttributedStringKey: Any] = [
            .underlineStyle: NSUnderlineStyle.styleSingle.rawValue,
            .underlineColor: UIColor.darkGray]
        mutableAttrStr.addAttributes(attrkeys, range: NSRange(location:0, length: buttonTitle.count))
        nextButton.setAttributedTitle(mutableAttrStr, for: .normal)
    }
    
    // 데이터 주고받을 경우, 뷰디드로드 / 디이닛에 옵저버 제거하는거 설정.
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    private func moveUpWithKeyboard() {
        
    }
}



// MARK: - UITextFieldDelegate
extension ViewController : UITextFieldDelegate {
    
    // 리턴 눌렀을 때.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 다음 뷰컨트롤러로 넘어갈 수 있으면 넘어가고 아니면 놉
        if shouldPerformSegue(withIdentifier: nextVCModalSegue, sender: nil) {
            performSegue(withIdentifier: nextVCModalSegue, sender: nil)
        }
        //        textField.resignFirstResponder()
        return true
    }
    
    // TF에 변화가 생길 때, 변화를 받아들일지 말지를 결정.
    // 닉네임 길이 제한 등등.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // textField.text 는 기존에 입력되어져 있는 텍스트
        let text = textField.text ?? ""
        
        // replacementString string : 새로 들어오는 입력값
        let replaceText = (text as NSString).replacingCharacters(in: range, with: string)
        
        placeholderLabel.text = replaceText.isEmpty ? "your-url.slack.com" : ".slack.com"
        nextButton.isSelected = !replaceText.isEmpty
        
        /***************************************************
         <아래 로직은 안씀>
         string.isEmpty (cut, delete 등 적용했을 경우)
         -. text 가 있을 경우, start index ~ end index -1 (offset: -1)까지 스트링으로 만들기.
         -. String(text[startIndex..<endIndex])
         text.appending(string) (더할경우)
         
         Issue.
         1. 중간부터 내용을 삭제할 경우. (맨 뒤에꺼부터 지운걸로 판단함)
         2. 동시에 여러 글자 삭제할 경우. (맨 뒤 한글자 삭제된걸로 판단함)
         ***************************************************/
        
        let attrKey = [NSAttributedStringKey.font : textField.font!]
        let textWidthSize = (replaceText as NSString).size(withAttributes: attrKey).width
        // 사이즈를 알기 위해서 특성값이 필요함.
        
        guard textWidthSize < (view.bounds.width - 120) else { return false }
        
        placeholderLabelLeadingConstraint.constant = textWidthSize
        // 왼쪽 라벨의 위치를 입력한 텍스트의 사이즈만큼 떨어뜨려 줌.
        return true
    }
    
    
    
    
    
    // Transition
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.destination is NextViewController else { return }
        print(segue.destination)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == nextVCModalSegue, nextButton.isSelected else {
            // 입력없이 넥스트 버튼 누르면 진동옴
            vibration()
            return false
        }
        return true
    }
    
    // 휴대폰 진동
    private func vibration() {
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate) { [weak self] in
            DispatchQueue.main.async {
                self?.urlTextField.becomeFirstResponder()
            }
        }
    }
    
    
    
    // unwind
    @IBAction private func unwind(_ sender: UIStoryboardSegue) {
        print(sender.source)
    }
}
