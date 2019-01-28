//
//  NimbleTests.swift
//  AsyncUnitTestTests
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import XCTest
import Nimble
@testable import AsyncUnitTest

class NimbleTests: XCTestCase {

    
    func nimbleTest() {
        expect(1 + 1).to(equal(2))
        expect(1.2).to(beCloseTo(1.1, within: 0.1))
        expect(3) > 2
        expect("seahorse").to(contain("sea"))
        expect(["Atlantic", "Pacific"]).toNot(contain("Mississippi"))
//        expect(ocean.isClean).toEventually(beTruthy())
    }
    
}
