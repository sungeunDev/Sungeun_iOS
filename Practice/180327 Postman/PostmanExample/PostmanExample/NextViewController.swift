//
//  NextViewController.swift
//  PostmanExample
//
//  Created by sungnni on 2018. 3. 27..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Alamofire

var postArray: [Post]?
class NextViewController: UIViewController {
    
    @IBOutlet private weak var titleTf: UITextField!
    @IBOutlet private weak var contentTf: UITextField!
    @IBOutlet private weak var imgTf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction private func postList() {
        let postUrl = "https://api.lhy.kr/posts/"
        
        Alamofire
            .request(postUrl, method: .get)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    let result = try! JSONDecoder().decode([Post].self, from: value)
                    postArray = result
                    
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVC = storyBoard.instantiateViewController(withIdentifier: "ThirdTableViewController") as! ThirdTableViewController
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    @IBAction private func postCreate() {
        
        let postUrl = "https://api.lhy.kr/posts/"
        let token = userInfo!.token
        let header = [
            "Authorization" : "Token \(token)"
        ]
        
        guard let title = titleTf.text else { return }
        guard let content = contentTf.text else { return }
        guard let img = imgTf.text else { return }
        
        let param = [
            "title" : title,
            "content" : content,
            "img_cover" : img
        ]
        
//        Alamofire
//            .upload(<#T##fileURL: URL##URL#>, to: <#T##URLConvertible#>, method: <#T##HTTPMethod#>, headers: <#T##HTTPHeaders?#>)
//
            
        Alamofire
            .request(postUrl, method: .post, parameters: param, headers: header)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    let result = try! JSONDecoder().decode(Post.self, from: value)
                    print(result.title)  
                case .failure(let error):
                    print(error)
                }
        }
    }
}

