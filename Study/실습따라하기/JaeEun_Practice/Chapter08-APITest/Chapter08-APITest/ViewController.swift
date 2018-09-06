//
//  ViewController.swift
//  Chapter08-APITest
//
//  Created by sungnni on 2018. 9. 6..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var responseView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // GET PRACTICE
    @IBAction private func callCurrentTime(_ sender: Any) {
        do {
            // 1. URL 설정 및 GET 방식으로 API 호출
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            let response = try String(contentsOf: url!)
            /***************************************************
             < GET방식의 호출 구문 >
             -. try! Data(contentsOf: URL)
                ㄴ Base64 인코딩된 문자열을 반환. 보통 바이너리 데이터를 읽어올 때 사용(ex. 이미지)
             -. try! String(contentsOf: URL)
             -. try! NSString(contentsOf: URL, encoding: String.Encoding.utf8.rawValue)
                ㄴ 응답 결과에 한글이나 한자 등 2바이트를 사용하는 언어가 포함되어 있을 경우, UTF-8등으로 인코딩을 지정해야 할 때 사용
             ***************************************************/
            
            self.currentTimeLabel.text = response
            self.currentTimeLabel.sizeToFit()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    // POST PRACTICE
    @IBAction private func post(_ sender: Any) {
        // 1. 전송할 값 준비
        let userId = self.userId.text!
        let userName = self.userName.text!
        let param = "userId=\(userId)&name=\(userName)" // key1=value1&key2=value2...
        let paramData = param.data(using: .utf8) // URL Encoding. 다른 언어에서는 직접 URL 인코딩 함수를 적용해 인코딩 해야하지만, 스위프트에서는 Data 객체 형식으로 변경하면 자연스럽게 URL 인코딩이 적용됨.
        
        // 2. URL 객체 정의
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        
        // 3. URLRequest 객체를 정의하고, 요청 내용을 담는다.
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // 4. HTTP 메시지 헤더 설정
        // 헤더? - 실제 내용에는 포함되지 않으면서, 전송하는 콘텐츠에 대한 형식이나 특성 등 메타 정보를 제공하는 역할
        // Content-Type: 메시지 본문이 어떤 타입으로 작성되어 있음을 알려줌
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        // Content-Length: 전송할 메시지 본문의 길이를 알려줌
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 응답시 실행할 내용 작성(HTTP 통신은 비동기로 이루어지기 때문에, 응답값을 받아 처리할 내용을 클로저 형태로 미리 작성해서 인자값으로 넣어줌)
            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
            if let error = error {
                NSLog("An error has occurred: \(error.localizedDescription)")
                return
            }
            // 5-2. 응답 처리 로직
            // 5-2-1. 메인 스레드에서 비동기로 처리되도록 함
            DispatchQueue
            
            
            
        } // 전송 준비 끝! 대기 상태
        
        // 6. 서버로 POST 전송하여 API 호출
        task.resume()
    }
}

