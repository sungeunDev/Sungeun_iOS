//
//  ViewController.swift
//  JSONSample
//
//  Created by sungnni on 2018. 3. 21..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONPractice()
//        parsingJSON()
    }
    
    func JSONPractice() {
    
        let jsonString =
        """
        {
        "id": "0001",
        "type": "donut",
        "name": "Cake",
        "ppu": 0.55,
        "batters":
        {
            "batter":
            [
            { "id": "1001", "type": "Regular" },
            { "id": "1002", "type": "Chocolate" },
            { "id": "1003", "type": "Blueberry" },
            { "id": "1004", "type": "Devil's Food" }
            ]
        },
        "topping":
        [
        { "id": "5001", "type": "None" },
        { "id": "5002", "type": "Glazed" },
        { "id": "5005", "type": "Sugar" },
        { "id": "5007", "type": "Powdered Sugar" },
        { "id": "5006", "type": "Chocolate with Sprinkles" },
        { "id": "5003", "type": "Chocolate" },
        { "id": "5004", "type": "Maple" }
        ]
        }
        """
        
        let jsonData = jsonString.data(using: .utf8)

        guard let data = jsonData,
        let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String:Any]
            else {
                print("no data")
                return
        }
        
        guard let name = jsonObject["name"] as? String,
        let batters = jsonObject["batters"] as? [String:Any]
            else {
                print("parsing error")
                return
        }
        
        print(name)
        print(batters)

//        let jsonData = jsonString.data(using: .utf8)!
//            print(jsonData)
//
//        do {
//            let foundationObject = try JSONSerialization.jsonObject(with: jsonData)
//            if let jsonDict = foundationObject as? [String: Any] {
//                print(jsonDict)
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
    }
  
    
    
    func parsingJSON() {
        // https면 괜찮은데, http인 경우. info.plist 에 App Transport Security Settings - Allow Arvitary Loads : YES
        // Apple이 http는 금지한다고 했는데 아직은 유예기간 입니당
        let apiURL = URL(string: "http://api.open-notify.org/astros.json")!
        let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            
            // 에러 처리
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            // response 처리
            guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else {
                // ~= : response가 200~399 범위 안에 들어있는지 체크. 안에 들어있으면 true
                print("StatusCode is not valid")
                return
            }
            
            // data 처리
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String:Any]
                // try & downCasting(as?로 처리할 경우) jsonObject -> Optional -> 한번더 바인딩 해줘야 함.
                else {
                    print("No data")
                    return
            }
            guard jsonObject["message"] as? String == "success",
                let people = jsonObject["people"] as? [[String: String]],
                let peopleCount = jsonObject["number"] as? Int
                else {
                    print("parsing error")
                    return
            }
            print("\n---------- [ json Object ] -----------\n")
            print(jsonObject)
            
            print("\n---------- [ 우주비행사 명단 ] -----------\n")
            print(people)
            print(peopleCount, "명")
            
            print("\n---------- [ 정리 ] -----------\n")
//            people.flatMap { print($0["name"]) }
            people.flatMap { $0["name"] }.forEach ({ print($0) })
        }
        dataTask.resume()
        // activate 상태가 아니기 때문에 꼭 resume을 해줘야 됨.
    }
    
}

