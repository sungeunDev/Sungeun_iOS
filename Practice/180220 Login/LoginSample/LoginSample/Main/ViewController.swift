//
//  ViewController.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 20..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

let cellHeight: CGFloat = 65
class ViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    
    lazy var friendList: [UserModel] = MainDataCenter.sharedInstance.friendListModel

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 순서는 segue -> prepare -> didSelected
    // segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    // prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // sender = 클릭하는 주체
        if let cell = sender as? MainCell,
            // 세그를 통해 목적지 알 수 있음
            let nextVC = segue.destination as? DetailViewController
            {
                nextVC.userData = cell.cellData!
        }
    }
}


// tableView Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return MainDataCenter.sharedInstance.friendListCount (같은 내용)
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell
        
        //        cell.cellData = MainDataCenter.sharedInstance.friendData(with: indexPath.row)
        cell.cellData = friendList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    // didSelected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let cell = tableView.cellForRow(at: indexPath) as! MainCell
        // cell.cellData
        // 셀 데이터를 다음 뷰 컨트롤러에 전달해야 하는데, 얘는 다음 뷰 컨트롤러를 모름.
        // 코드로 작성할 수는 있지만, 세그로 전달했기 때문에 안됨.
        
        
        // 선택된거 없애는(되돌리는) 코드
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
