//
//  NimbleTests.swift
//  AsyncUnitTestTests
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import AsyncUnitTest

class NimbleTests: XCTestCase {
    
    let fooService = FooService()
    
//    func testNimble() {
//        expect(1 + 1).to(equal(2))
//        expect(1.2).to(beCloseTo(1.1, within: 0.1))
//        expect(3) > 2
//        expect("seahorse").to(contain("sea"))
//        expect(["Atlantic", "Pacific"]).toNot(contain("Mississippi"))
//        //        expect(ocean.isClean).toEventually(beTruthy())
//    }
    
    func testForWhat() {
        it("What?") {
            print("hihi")
        }
    }
    
    func testQuick() {
        it("Compares parameters equally using waitUtil.") {
            let text = "Test param string"
            waitUntil(timeout: 2, action: { done in
                self.fooService.execute(param: text, delay: 1, complete: { (param) in
                    expect((param as! String)).to(equal(text))
                    done()
                })
            })
        }
    }
    
    func testQuickNimble() {
        let text = "Test param string"
        var inClosureText: String = ""
        
        fooService.execute(param: text, delay: 1) { (param) in
            inClosureText = param as! String
        }
        expect(inClosureText).toEventually(equal(text), timeout: 2)
    }
}
