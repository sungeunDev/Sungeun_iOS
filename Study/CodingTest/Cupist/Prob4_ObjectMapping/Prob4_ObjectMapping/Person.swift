//
//  Person.swift
//  Prob4_ObjectMapping
//
//  Created by sungnni on 2018. 9. 13..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

class Person: Codable {
    let name: String
    let birthday: String
    let height: Int
    let job: String
    let location: String
    let hobbys: [String]?

    init(name: String, birthday: String, height: Int, job: String, location: String, hobbys: [String]? = nil) {
        self.name = name
        self.birthday = birthday
        self.height = height
        self.job = job
        self.location = location
        self.hobbys = hobbys
    }
    
    // MARK: - public
    public func validate() -> Bool {
        if validName(of: name),
            validBirthday(of: birthday),
            validHeight(of: height),
            validJob(of: job),
            validLocation(of: location),
            validHobbies(of: hobbys) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - private
    private func validName(of name: String) -> Bool {
        let nameRegEx = "^[가-힣]+${2,4}"
        let nameCheck = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        if !nameCheck.evaluate(with: name) {
            print("\(#file) \(#line): \("name은 2~4자의 한글만 가능합니다.")")
            return false
        } else {
            return true
        }
    }
    
    private func validBirthday(of birth: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: birth)
        if let _ = date {
            return true
        } else {
            print("\(#file) \(#line): \("birthday는 yyyy-MM-dd 형식만 가능합니다.")")
            return false
        }
    }
    
    private func validHeight(of height: Int) -> Bool {
        if !((120...200) ~= height) {
            print("\(#file) \(#line): \("height는 120-200 사이의 숫자만 가능합니다.")")
            return false
        } else {
            return true
        }
    }
    
    private func validJob(of job: String) -> Bool {
        let jobRegEx = "^[가-힣a-zA-Z]+$"
        let jobCheck = NSPredicate(format:"SELF MATCHES %@", jobRegEx)
        if !jobCheck.evaluate(with: job) {
            print("\(#file) \(#line): \("job은 한글, 영문 대소문자만 가능합니다.")")
            return false
        } else {
            return true
        }
    }
    
    private func validHobbies(of hobbies: [String]?) -> Bool {
        return true // 제한 없음
    }
    
    private func validLocation(of location: String) -> Bool {
        let point = location.components(separatedBy: ",")
        
        func toDouble(of str: String) -> Double? {
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US_POSIX")
            return numberFormatter.number(from: str)?.doubleValue
        }
        
        if let _ = toDouble(of: point[0]), let _ = toDouble(of: point[1]) {
            return true
        } else {
            print("\(#file) \(#line): \("location은 좌표 포맷만 가능합니다.")")
            return false
        }
    }
}
