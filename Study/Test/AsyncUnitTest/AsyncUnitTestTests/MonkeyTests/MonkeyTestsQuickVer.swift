//
//  MonkeyTestsQuickVer.swift
//  AsyncUnitTestTests
//
//  Created by Ari on 07/02/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import Quick
import Nimble

@testable import AsyncUnitTest
class MonkeySpeck: QuickSpec {
    override func spec() {
        it("is monkey") {
            let banana = Banana()
            expect(banana.peel())
        }
    }
}
