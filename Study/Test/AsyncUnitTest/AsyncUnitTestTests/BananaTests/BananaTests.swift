//
//  BananaTests.swift
//  AsyncUnitTestTests
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import XCTest
@testable import AsyncUnitTest

class BananaTests: XCTestCase {

    let banana = Banana()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testPeel_makesTheBananaEdible() {
        banana.peel()
        XCTAssertTrue(banana.isEdible)
    }
}
