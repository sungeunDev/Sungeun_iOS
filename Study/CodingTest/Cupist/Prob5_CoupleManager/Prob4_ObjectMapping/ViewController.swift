//
//  ViewController.swift
//  Prob4_ObjectMapping
//
//  Created by sungnni on 2018. 9. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var coupleManager: CoupleManager?
    var male: Male?
    var female: Female?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n---------- [ Prob 4. Object Mapping ] -----------\n")
        maleMapping()
        femaleMapping()
        
        print("\n---------- [ Prob 5. CoupleManager ] -----------\n")
        makeCoupleManager()
    }

    // MARK: - Prob 5. CoupleManager
    func makeCoupleManager() {
        guard let male = male, let female = female else { return }
        
        print("\n---------- [ me: 남 / you : 여 ] -----------\n")
        coupleManager = CoupleManager(first: male, second: female)
        
        for functionIndex in 1...4 {
            coupleManager!.manager(of: functionIndex)
        }
        
        print("\n---------- [ me: 여 / you : 남 ] -----------\n")
        coupleManager = CoupleManager(first: female, second: male)
        
        for functionIndex in 1...4 {
            coupleManager!.manager(of: functionIndex)
        }
    }
    
    
    // MARK: - Prob 4. Object Mapping
    func maleMapping() {
        let url = Bundle.main.url(forResource: "male", withExtension: "json")
        do {
            let data = try Data(contentsOf: url!)
            let male = try JSONDecoder().decode(Male.self, from: data)
            if male.validate() {
                print("모든 값이 유효합니다.")
                self.male = male
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
                self.female = female
            }
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}

