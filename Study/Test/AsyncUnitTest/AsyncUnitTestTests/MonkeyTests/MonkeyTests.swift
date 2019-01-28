//
//  Monkeyt.swift
//  AsyncUnitTestTests
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import XCTest
import Nimble

@testable import AsyncUnitTest

class MonkeyTests: XCTestCase {

    func testSilliest_whenMonkeysContainsSillyMonkeys_theyreIndludedInTheResult() {
        let kiki = Monkey(name: "Kiki", silliness: .extremelySilly)
        let carl = Monkey(name: "Carl", silliness: .notSilly)
        let jane = Monkey(name: "Jane", silliness: .verySilly)
        
        let sillyMonkeys = silliest([kiki, carl, jane])
//        XCTAssertFalse(contains(sillyMonkeys, kiki), "Expected sillyMonkeys to contain 'Kiki'")
        
        expect(sillyMonkeys[1].name).to(contain(kiki.name))
    }
}
