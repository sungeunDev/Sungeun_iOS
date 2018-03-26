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
    
    

    @IBOutlet private weak var recipeTableView: UITableView!
    var recipeList: [Recipe]? = nil
    
    var url: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fullUrl+=url!
//        print(fullUrl)
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
    }
    
    
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (recipeList?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! RecipeTableViewCell
        cell.recipeLabel.text = recipeList?[indexPath.row].text
        
        guard let temp  =  self.recipeList![indexPath.row].image else {
            return cell
        }
        Alamofire.request((self.recipeList![indexPath.row].image)!).responseData { (response) in
            if response.error == nil {
                print(response.result)
                if let data = response.data {
                    cell.recipeImageView.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }
    
    
    
 
}

