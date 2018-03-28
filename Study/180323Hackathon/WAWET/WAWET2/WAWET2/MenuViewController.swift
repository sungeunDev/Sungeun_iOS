//
//  MenuViewController.swift
//  WAWET2
//
//  Created by sungnni on 2018. 3. 28..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit
import Alamofire
var node = "http://172.30.1.7:3000"
class MenuViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var menuCollectionView: UICollectionView!
    @IBOutlet var testLabel: UILabel?

    var menuList: [Menu]? = []
    
    var data: Category?{
        didSet{
            testLabel?.text = data?.title
            
            let url = node+"/theme?url="+(data?.href)!
            print(url)
            Alamofire
            .request(url, method: .get)
            .validate()
                .responseData { (response) in
                    switch response.result {
                    case .success(let value):
                        let data = try? JSONDecoder().decode([Menu].self, from: value)
                        self.menuList = data
                        self.menuCollectionView.reloadData()
//                        print("hi")
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
            }
//            print("test")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.menuCollectionView.delegate = self
        self.menuCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = menuList?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        cell.menu = menuList?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let recipeVC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        recipeVC.recipeUrl = node+"/recipe?n="+(menuList?[indexPath.row].href)!
        
        self.navigationController?.pushViewController(recipeVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 10
        let a = (self.view.bounds.size.width - 10) / 2
        return CGSize(width: a, height: a)
    }
    
    
}
