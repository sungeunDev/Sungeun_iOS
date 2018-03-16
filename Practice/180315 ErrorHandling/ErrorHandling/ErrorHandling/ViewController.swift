//
//  ViewController.swift
//  ErrorHandling
//
//  Created by sungnni on 2018. 3. 15..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /********************************************
 
    ********************************************/
    
    private let tmpDir = NSTemporaryDirectory()
    private let filePath = NSTemporaryDirectory() + "swift.txt"
    private let errorFilePath = NSTemporaryDirectory() + "noFile.txt"
    
    enum MyError: Error {
        case errorExample
        case errorWithParam(num: Int)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        createDummyFile()
//        basic()
        
//        throwsFunctionExample()
        deferEx()
    }
    
    private func createDummyFile() {
        let swift = "Swift Error Handling"
        
        // write : String의 내용을, 지정된 인코딩을 사용해, 지정된 패스의 파일에 기입합니다.
        // UTF-8은 유니코드를 위한 가변 길이 문자 인코딩 방식 중 하나
        try? swift.write(toFile: filePath, atomically: true, encoding: .utf8)
    }
    
    private func basic() {
        let swift = "Swift Error Handling"
        
        do {
            // 옵셔널 처리 해줄 경우 nil 값이기 때문에 아래 코드까지 실행
            try? swift.write(toFile: tmpDir, atomically: true, encoding: .utf8)
            
//            try swift.write(toFile: tmpDir, atomically: true, encoding: .utf8) // <- tmpDir : 디렉토리
            // 위 코드 에러 발생해서 아래 코드는 실행 안됨
            try swift.write(toFile: filePath, atomically: true, encoding: .utf8)
            
        } catch { // <- catch만 입력시, 기본적으로 let error 를 사용한 것과 동일
            
            print(error)
            // 전체 에러 중 localized~에 해당하는 부분만 나옴
            print(error.localizedDescription)
        }
        // do~catch 영역 외의 부분은 실행 됨.
    }
    
    
    /***************************************************
     throws Function Example
     ***************************************************/
    private func throwsFunctionExample() {
        
        print("\n---------- [ NSError ] -----------\n")
        do {
            try throwNSError()
        } catch {
            print("Error :", error)
            print("Error LocalizedDescription :", error.localizedDescription)
            
            let e = error as NSError
            print("nsError: ", e)
            print("domain: ", e.domain)
            print("code: ", e.code)
            print("userInfo: ", e.userInfo)
        }
        
        print("\n---------- [ Custom Error ] -----------\n")
        do {
            try throwError()
        } catch {
            print("Error :", error)
            print("Error LocalizedDescription :", error.localizedDescription)
            
            let e = error as NSError
            print("nsError: ", e)
            print("domain: ", e.domain)
            print("code: ", e.code)
            print("userInfo: ", e.userInfo)
        }
        
        print("\n---------- [ Matching Error ] -----------\n")
        do {
            try throwError()
        } catch MyError.errorExample {
            print("errorExample")
        } catch MyError.errorWithParam(let num) {
            print("error with number param: ", num)
        } catch {
            print("The Error is not MyError")
        }
    }
    
    
    /***************************************************
     에러 던지기
     ***************************************************/
    private func throwNSError() throws {
        throw NSError(domain: "domain data", code: 55, userInfo: ["something":11])
    }
    
    private func throwError() throws {
        // throws 메서드에서는 ~
        
        // 메서드 자체에 throw가 붙어 있음. 에러 나도록 만든 구문
//        try "1".write(toFile: tmpDir, atomically: true, encoding: .utf8)
        
        // 해당 에러를 직접 날려주는 것
        throw MyError.errorWithParam(num: 10)
    }
    
    
    /***************************************************
     rethrows
     ***************************************************/
    private func someRethrowsFunc(_ fn: () throws -> ()) rethrows {
        
        try fn() // ok
        // 다시 던져주니까 다른데서 처리한다는 걸 컴파일러가 알기 때문에 옵셔널 안붙여줘도 됨. 에러 발생시 rethrows 해서 다른데서 처리.
        
        // rethrows는 받는 파라미터(fn. throws 있음)에 대해서 처리해줌.
        
        // 메서드 내에서 자체 처리하는 방식으로 만들어도 됨.
    }
    
    
    /***************************************************
     defer
     ***************************************************/
    private func deferOrder() {
        print("start")
        defer { print("defer1") }
        print("center")
        defer { print("defer2") }
        // 가장 마지막 defer가 먼저 호출됨.
        defer { print("defer3") }
        print("end")
    
        // 아래 같은 방식으로도 이용됨.
        var i = 0
        while  i < 60 {
            defer{ i += 5 }
            if 1 == 1 {
                continue
            }
        }
    }
    
    private func deferEx() {
        defer {
            print("task1")
        }
        do {
            try throwError()
        } catch {
            print(error)
            return
        }
        
        defer {
            print("this is not called when error occured")
        }
    }
    
    
    
}

