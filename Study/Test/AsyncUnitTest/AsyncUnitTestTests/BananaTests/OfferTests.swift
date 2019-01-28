//
//  offerTests.swift
//  AsyncUnitTestTests
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import XCTest
@testable import AsyncUnitTest

class OfferTests: XCTestCase {

    var banana: Banana!
    
    override func setUp() {
        super.setUp()
        banana = Banana()
    }

    func testOffer_whenTheBananaIsPeeled_offersTheBanana() {
        banana.peel()
        let message = offer(banana: banana)
        XCTAssertEqual(message, "Hey, want a banana?")
    }
    
    func testOffer_whenTheBananaIsntPeeled_offersToPeelTheBanana() {
        let message = offer(banana: banana)
        XCTAssertEqual(message, "Hey, want me to peel this banana for you?")
    }

}
