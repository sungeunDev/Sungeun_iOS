//
//  ViewController.swift
//  0309
//
//  Created by 박성은 on 2018. 3. 9..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}


struct Unit {
    enum UnitName {
        case marine, medic, gost
    }
    var type: UnitName
    func attack() {
        switch type {
        case .marine:
            print("Bbang")
        case .medic:
            print("heal")
        case .gost:
            print("newClear launched detected")
        }
    }
}

class ViewController: UIViewController {
    
    let myPet = [
        Pet(type: .dog, age: 13),
        Pet(type: .dog, age: 2),
        Pet(type: .dog, age: 7),
        Pet(type: .cat, age: 9),
        Pet(type: .snake, age: 4),
        Pet(type: .pig, age: 5)
    ]
    
    let unit = [
        Unit(type: .marine),
        Unit(type: .medic),
        Unit(type: .gost)
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // teacher
        print(sum())
        
        // mine
        print(dogAgeSum(myPet))
        print(newAge(myPet))
        
        myPet.filter { (pet) -> Bool in
            pet.type == .dog
        }
        
        // stateless
        myPet.filter {
            $0.type == .dog
        }
        
        myPet.reduce(0) {
            (<#Result#>, <#Pet#>) -> Result in
            $0 + $1.age
        }
        
        myPet.reduce(0) {
            $0 + $1.age
        }
        
        
        
        myPet.map {
            Pet(type: $0.type, age: $0.age+1)
        }
    }
    
    // 1. 강아지들의 나이를 합산한 결과를 반환하는 sum 함수 구현
    // 2. 모든 펫의 나이를 1씩 더한 배열을 반환하는 newAge 함수 구현
    func dogAgeSum(_ list:[Pet]) -> Int {
        var returnResult = 0
        for pet in list {
            if pet.type == .dog
            {
                returnResult += pet.age
            }
        }
        return returnResult
    }
    
    func newAge(_ list: [Pet]) -> [Pet] {
        var returnResult = [Pet]()
        for pet in list {
            let newPet = Pet(type: pet.type, age: pet.age+1)
            returnResult.append(newPet)
        }
        return returnResult
    }
    
    func sum() -> Int {
        var ageSum = 0
        for pet in myPet {
            // continue : present roop stop & skip to next roop
            guard pet.type == .dog else { continue }
            ageSum += pet.age
        }
        return ageSum
    }
    
    
}


