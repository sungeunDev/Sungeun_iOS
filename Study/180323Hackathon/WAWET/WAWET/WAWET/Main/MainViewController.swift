//
//  MainViewController.swift
//  WAWET
//
//  Created by sungnni on 2018. 3. 23..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, CustomViewDelegete
{
    var list: [categoryItem] = []
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        let custom = CustomClass()
        custom.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        list.append(categoryItem(title: "제철메뉴", subTitle: ["봄", "여름", "가을", "겨울"], img: "season.jpg"))
        list.append(categoryItem(title: "다이어트, 건강", subTitle: ["저칼로리", "디톡스","피로회복"], img: "diet.jpg"))
        list.append(categoryItem(title: "아이를 위한", subTitle: ["간식", "성장발달"], img: "baby.jpg"))
        list.append(categoryItem(title: "테마", subTitle: ["자취생", "요리초보", "글로벌"], img: "global.jpg"))
    }
 
    
    func customViewListener(title: String, subTitle: String) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        nextVC.subTitle = [title, subTitle]
        
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.delegate = self
        cell.item = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }
}

