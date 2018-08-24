//
//  MemoFromVC.swift
//  Chapter01-MyMemory
//
//  Created by sungnni on 2018. 8. 24..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController {
  var subject: String!
  
  @IBOutlet var contents: UITextView!
  @IBOutlet weak var preview: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()


    }


  @IBAction private func save() {
    guard self.contents.text.isEmpty == false else {
      let alert = UIAlertController(title: nil, message: "내용을 입력해 주세요.", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      self.present(alert, animated: true, completion: nil)
      return }
    
    let data = MemoData()
    
    data.title = self.subject
    data.contents = self.contents.text
    data.image = self.preview.image
    data.regDate = Date()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.memoList.append(data)
    
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction private func pick() {
    
    let alert = UIAlertController(title: "이미지를 가져올 곳을 선택해 주세요.", message: "", preferredStyle: .actionSheet)
    let cameraAction = UIAlertAction(title: "카메라", style: .default) { (action) in
      let picker = UIImagePickerController()
      
      if UIImagePickerController.isSourceTypeAvailable(.camera) {
        picker.sourceType = .camera
        picker.delegate = self
        self.present(picker, animated: false, completion: nil)
      } else {
        print("Camera not available")
      }
    }
    let library = UIAlertAction(title: "앨범", style: .default) { (action) in
      let picker = UIImagePickerController()
      picker.delegate = self
      picker.allowsEditing = true
      self.present(picker, animated: false, completion: nil)
    }
    alert.addAction(cameraAction)
    alert.addAction(library)
    self.present(alert, animated: false, completion: nil)
  }
}

extension MemoFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    self.preview.image = info[UIImagePickerControllerEditedImage] as? UIImage
    picker.dismiss(animated: false, completion: nil)
  }
}

extension MemoFormVC: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    let contents = textView.text as NSString // String에는 length property가 없음.
    let length = (contents.length > 15) ? 15 : contents.length
    self.subject = contents.substring(with: NSRange(location: 0,
                                                    length: length))
    self.navigationItem.title = subject
  }
}
