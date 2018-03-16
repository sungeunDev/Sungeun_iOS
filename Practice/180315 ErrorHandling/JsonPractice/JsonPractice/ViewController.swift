//
//  ViewController.swift
//  JsonPractice
//
//  Created by sungnni on 2018. 3. 15..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var persons: [String:Any] = [:]
    var nameArr: [String] = []
    var ageArr: [String] = []
    var employedArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        jsonParsing()
        grocery()
    }
    
    private func jsonParsing() {
        let fullPath = "/Users/sungnni/Desktop/person.json"
        if let data = try? String(contentsOfFile: fullPath).data(using: .utf8)! {
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            persons = json
            
            if let person = persons["person"] as? [[String: Any]]{
                for personIndex in person {
                    nameArr.append(personIndex["name"] as! String)
                    ageArr.append(personIndex["age"] as! String)
                    employedArr.append(personIndex["employed"] as! String)
                }
                
                let decoder = JSONDecoder()
                let product = try! decoder.decode(Person.self, from: data)
                print(product)
            }
        }
    }
    
    func grocery() {
        let json = """
{
    "name": "Durian",
    "points": 600,
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let product = try? decoder.decode(GroceryProduct.self, from: json)
        
        print(product?.name as Any)
    }
    
}

struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}



