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
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        var app: XCUIApplication
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWarningShowUp() {
        
        let app = XCUIApplication()
        let warning = app.
        app.textFields["userInput"].typeText("")
        app.buttons["Let's do some magic!"].tap()
        
        
        XCTAssertTrue(<#T##expression: Bool##Bool#>)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
}
