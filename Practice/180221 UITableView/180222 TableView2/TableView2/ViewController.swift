//
//  ViewController.swift
//  TableView2
//
//  Created by 박성은 on 2018. 2. 22..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var maintableView: UITableView!
    
    // <샘플> 데이터 swift (클레스가 아닌 파일로 만들면 전역변수처럼 쓸 수 있당
    // 딕셔너리 어레이로 표현하기
    // 일반적으로는 pList 파일 안에 저장해서 불러오기
    
    let cartegoryList = ["식비", "식비", "교통비", "쇼핑", "저축", "식비", "교통비", "쇼핑", "식비", "교통비", "저축"]
    let contentList = ["이마트", "데자와", "신한교통", "언니 생일선물", "세뱃돈", "밥", "택시", "옷", "커피", "대중교통", "적금"]
    let priceList = ["10,150", "600", "85,950", "7,000", "300,000", "10,150", "600", "85,950", "10,150", "600", "85,950"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK : - UITableViewDataSource
    //테이블뷰의 row의 갯수를 테이블뷰에 알려주는 데이터 소스
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartegoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
        //cell에 데이터 할당
        cell.cartegoryLb.text = cartegoryList[indexPath.row]
        cell.contentLb.text = contentList[indexPath.row]
        cell.priceLb.text = priceList[indexPath.row]
        
        cell.priceTextColorChange(cartegory: cartegoryList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "2018/02/22"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}

