//
//  Test.swift
//  AsyncUnitTest
//
//  Created by Ari on 24/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import XCTest
import Nimble
@testable import AsyncUnitTest

// Arrange -> Act -> Assert
class FooServiceUnitTest: XCTestCase {

    let fooService = FooService()
    
    func testPassParam() {
        let execute = expectation(description: "in closure")
//        let executeExpectation = XCTestExpectation(description: "in closure")
        let text = "Test parm string"
        fooService.execute(param: text, delay: 1) { (param) in
            execute.fulfill()
            expect(text).to(equal(param as! String))
        }
        wait(for: [execute], timeout: 2)
    }
    
    func testCancelExecuteClosure() {
        let executeExpectation = XCTestExpectation(description: "in closure")
        executeExpectation.isInverted = true
        fooService.execute(param: "param", delay: 1) { (param) in
            executeExpectation.fulfill()
        }
        fooService.cancel()
        wait(for: [executeExpectation], timeout: 2)
    }
    
    func testDoubleExecuteClosure() {
        let executeExpectation = XCTestExpectation(description: "in closure")
        let notExecuteExpectation = XCTestExpectation(description: "never execute")
        notExecuteExpectation.isInverted = true
        fooService.execute(param: "param", delay: 1) { (_) in
            notExecuteExpectation.fulfill()
            XCTFail()
        }
        fooService.execute(param: "param", delay: 1) { (_) in
            executeExpectation.fulfill()
        }
        wait(for: [executeExpectation, notExecuteExpectation], timeout: 2)
    }
}
