//
//  ViewController.swift
//  Prob4_ObjectMapping
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        maleMapping()
        femaleMapping()
    }

    func maleMapping() {
        let url = Bundle.main.url(forResource: "male", withExtension: "json")
        do {
            let data = try Data(contentsOf: url!)
            let male = try JSONDecoder().decode(Male.self, from: data)
            if male.validate() {
                print("모든 값이 유효합니다.")
            }
        } catch (let error) {
            print(error.localizedDescription)
        }
        
    }
    
    func femaleMapping() {
        let url = Bundle.main.url(forResource: "female", withExtension: "json")
        do {
            let data = try Data(contentsOf: url!)
            let female = try JSONDecoder().decode(Female.self, from: data)
            if female.info.validate() {
                print("모든 값이 유효합니다.")
            }
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}

