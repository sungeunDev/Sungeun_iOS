//
//  UITestSampleUITests.swift
//  UITestSampleUITests
//
//  Created by Ari on 2018. 10. 18..
//  Copyright © 2018년 ssungnni. All rights reserved.
//

import XCTest

class UITestSampleUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app.buttons["reset"].tap()
    }

    func testExample() {
        
        let app = XCUIApplication()
        let buttonElementsQuery = app.otherElements.containing(.button, identifier:"Button")
        let textField1 = buttonElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField1.tap()

        //given
        // typing -> button tap -> text2에 복사
        textField1.typeText("TESTING TEXT")
        app.buttons["Button"].tap()
        
        // 제대로 값이 복사됐는지 확인
        let textfield2Button = app.buttons["textField2"]
        XCTAssertTrue(textfield2Button.children(matching: .button)["TESTING TEXT"].exists)
    }

}
