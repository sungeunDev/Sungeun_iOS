//
//  MemoReadVC.swift
//  Chapter01-MyMemory
//
//  Created by sungnni on 2018. 8. 24..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {
  
  var param: MemoData?
  @IBOutlet weak var subject: UILabel!
  @IBOutlet weak var contents: UILabel!
  @IBOutlet weak var img: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.subject.text = param?.title
    self.contents.text = param?.contents
    self.img.image = param?.image
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd일 HH:mm분에 작성됨"
    let dateString = formatter.string(from: (param?.regDate)!)
    
    self.navigationItem.title = dateString
  }
  
  
}
