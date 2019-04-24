//
//  GitTheUserUITests.swift
//  GitTheUserUITests
//
//  Created by Dominik Kolber on 4/21/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import XCTest
@testable import GitTheUser

class GitTheUserUITests: XCTestCase {
    
    var app: XCUIApplication!

    
    override func setUp() {
        
        app = XCUIApplication()
        app.launch()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testWarningShowUp() {
        
        //given
        
        let app = XCUIApplication()
        let warningView = app.otherElements["userNotFoundView"]
        
        //when
        
        app.textFields["Enter a username..."].tap()
        
        let kKey = app/*@START_MENU_TOKEN@*/.keys["k"]/*[[".keyboards.keys[\"k\"]",".keys[\"k\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        kKey.tap()
        kKey.tap()
        
        let hKey = app/*@START_MENU_TOKEN@*/.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hKey.tap()
        hKey.tap()
        
        let vKey = app/*@START_MENU_TOKEN@*/.keys["v"]/*[[".keyboards.keys[\"v\"]",".keys[\"v\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        vKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["f"]/*[[".keyboards.keys[\"f\"]",".keys[\"f\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let jKey = app/*@START_MENU_TOKEN@*/.keys["j"]/*[[".keyboards.keys[\"j\"]",".keys[\"j\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        jKey.tap()
        jKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        vKey.tap()
        vKey.tap()
        vKey.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.buttons["Let's do some magic!"].tap()
        
        
        //then
        
        XCTAssertTrue(warningView.isHittable)
        XCTAssertTrue(warningView.exists)
    }
    
    //When everything is good warning view should not show
    func testWarningViewNotShowing() {
        
        //given
        let app = XCUIApplication()
        let warningView = app.otherElements["userNotFoundView"]

        //when
        
        app.textFields["Enter a username..."].tap()
        let bKey = app.keys["b"]
        let oKey = app.keys["o"]
        
        bKey.tap()
        oKey.tap()
        bKey.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        
        app.buttons["Let's do some magic!"].tap()
        //then
        XCTAssertFalse(warningView.exists)
    }
    
}
