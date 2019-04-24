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
    }

    func testWarningShowUp() {
        
        let app = XCUIApplication()
        //given
        let userTextField = app.textFields["Enter a username..."]
        let gitTheUserButton = app.buttons["Let's do some magic!"]
        
        //when
        
        userTextField.typeText("")
        gitTheUserButton.tap()
        
        //then
        
    }
    
    
    
}
