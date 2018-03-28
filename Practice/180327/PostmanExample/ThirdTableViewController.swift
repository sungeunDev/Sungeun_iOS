//
//  ThirdTableViewController.swift
//  
//
//  Created by sungnni on 2018. 3. 27..
//

import UIKit
import Alamofire

class ThirdTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        
        cell.cellPost = postArray?[indexPath.row]
        
        cell.titleLb.text = postArray?[indexPath.row].title
        cell.dateLb.text = postArray?[indexPath.row].createdDate
        cell.nameLb.text = postArray?[indexPath.row].author?.userName

        guard let img = postArray?[indexPath.row].imgCover else { return cell }
//        cell.imgView.image = UIImage(named: img)
//        -> 단순 url String. Alamofire 이용해서 url image를 가져와야 함.
        
        Alamofire.request(img).responseData { (response) in
            if response.error == nil {
                print(response.result)
                if let data = response.data {
                    cell.imgView.image = UIImage(data: data)
                }
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
}
