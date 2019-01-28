//
//  GorillaDBTests.swift
//  AsyncUnitTestTests
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import XCTest
@testable import AsyncUnitTest

class GorillaDBTests: XCTestCase {
    
    // Brittle Tests
    func testSave_savesTheBananaToTheDB_Brittle() {
        let database = GorillaDB()
        let originalSize = database.size
        
        let banana = Banana()
        database.save(banana: banana, key: "test-banana")
        
        XCTAssertEqual(database.size, originalSize + 1)
    }
    
    // Behavioral Tests
    func testSave_savesTheBananaToTheDB_BDD() {
        let db = GorillaDB()
        
        let banana = Banana()
        db.save(banana: banana, key: "test-banana")
        
        XCTAssertEqual(db.load(key: "test-banana")!, banana)
    }

}
