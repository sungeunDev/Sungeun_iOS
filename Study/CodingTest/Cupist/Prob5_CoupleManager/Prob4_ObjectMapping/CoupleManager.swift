//
//  CoupleManager.swift
//  Prob4_ObjectMapping
//
//  Created by sungnni on 2018. 9. 13..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation
import UIKit

enum Gender {
    case male
    case female
    case none
}

class CoupleManager {
    
    let myGender: Gender
    let me: PersonProtocol
    let you: PersonProtocol
    
    // MARK: - Init
    init(first: PersonProtocol, second: PersonProtocol) {
        if let _ = first as? Female, let _ = second as? Male {
            self.myGender = .female
        } else {
            if let _ = first as? Male, let _ = second as? Female {
                self.myGender = .male
            } else {
                self.myGender = .none
            }
        }
        self.me = first
        self.you = second
    }
    
    // MARK: - public manger method
    public func manager(of num: Int) {
        if myGender == .female {
            print("나이 차이: 1 / 떨어진 거리: 2 / 동일한 취미 수: 3 / 상대방 군필 여부: 4")
        } else {
            print("나이 차이: 1 / 떨어진 거리: 2 / 동일한 취미 수: 3")
        }
        
        print(num)
        
        switch num {
        case 1:
            managerAge()
        case 2:
            managerDistance()
        case 3:
            managerHobby()
        case 4 where myGender == .female:
            managerMilitary()
        default:
            print("숫자를 잘못 입력했습니다.")
        }
    }
    
    // MARK: - private manger method
    private func managerAge() {
        func parsingYear(of str: String) -> Int {
            let birthAgeStr = (str as NSString).substring(with: NSRange(location: 0, length: 4))
            guard let birthAge = Int(birthAgeStr) else { return 0 }
            return birthAge
        }
        
        let myBirth = parsingYear(of: me.info.birthday)
        let yourBirth = parsingYear(of: you.info.birthday)
        
        let yearDiff = myBirth - yourBirth
        if yearDiff > 0 {
            print("\(you.info.name)님이 \(yearDiff)살 연상입니다.")
        } else if yearDiff == 0 {
            print("\(you.info.name)님과 동갑입니다.")
        } else {
            print("\(you.info.name)님이 \(abs(yearDiff))살 연하입니다.")
        }
    }
    
    private func managerDistance() {
        func toPoint(of str: String) -> CGPoint? {
            let points = str.components(separatedBy: ",")
            guard let x = points[0].toDouble(), let y = points[1].toDouble() else { return nil }
            return CGPoint(x: x, y: y)
        }
        guard let lhs = toPoint(of: me.info.location),
        let rhs = toPoint(of: you.info.location) else { return }
        let distance = (pow(lhs.x - rhs.x, 2) + pow(lhs.y - rhs.y, 2)).squareRoot()
        if distance < 5 {
            print("\(you.info.name)님은 5km 거리 이내에 위치하고 있습니다.")
        } else {
            let distanceShort = String(format: "%.2f", distance)
            print("\(you.info.name)님은 \(distanceShort)km 거리에 위치하고 있습니다.")
        }
    }
    
    private func managerHobby() {
        guard let myHobbies = me.info.hobbys, let yourHobbies = you.info.hobbys else { return }
        var numOfMatches = 0
        for myHobby in myHobbies {
            for yourHobby in yourHobbies {
                if myHobby == yourHobby {
                    numOfMatches += 1
                }
            }
        }
        print("\(you.info.name)님과 취미가 \(numOfMatches)개 일치합니다.")
    }
    
    private func managerMilitary() {
        guard let _ = me as? Female, let you = you as? Male else { return }
        if you.isFulfilled {
            print("\(you.info.name)은 군필입니다.")
        } else {
            print("\(you.info.name)은 미필입니다.")
        }
    }
}

// MARK: - Extension
extension String {
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US_POSIX")
        return numberFormatter.number(from: self)?.doubleValue
    }
}

