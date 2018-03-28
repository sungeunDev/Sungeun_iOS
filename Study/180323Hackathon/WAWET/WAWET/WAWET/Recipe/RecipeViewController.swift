//
//  RecipeViewController.swift
//  WAWET
//
//  Created by sungnni on 2018. 3. 23..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Alamofire

class RecipeViewController: UIViewController {
    
    var recipeUrl: String? {
        didSet {
            Alamofire
                .request(recipeUrl!, method: .get)
                .validate()
                .responseData { (response) in
                    switch response.result {
                    case .success(let value):
                        let data = try? JSONDecoder().decode([Recipe].self, from: value)
                        self.recipeList = data!
                        self.recipeTableView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
            }
            
        }
    }
    
    @IBOutlet private weak var recipeTableView: UITableView!
    var recipeList: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        recipeTableView.reloadData()
    }
}


extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if recipeList[indexPath.row].image == nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "withoutImg", for: indexPath) as! RecipeTableViewCell
            cell.recipeLabel.text = recipeList[indexPath.row].text
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell

            cell.recipeLabel.text = recipeList[indexPath.row].text
            Alamofire
                .request((self.recipeList[indexPath.row].image)!)
                .responseData { (response) in
                if response.error == nil {
                    if let data = response.data {
                        cell.recipeImageView.image = UIImage(data: data)
                    }
                }
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if recipeList[indexPath.row].image == nil {
            return 70
        } else {
            return 350
        }
    }
    
    
    
    
}

