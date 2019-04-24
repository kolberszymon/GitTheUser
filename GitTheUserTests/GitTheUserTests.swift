//
//  GitTheUserTests.swift
//  GitTheUserTests
//
//  Created by Dominik Kolber on 4/21/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import XCTest
@testable import GitTheUser

class GitTheUserTests: XCTestCase {
    
    var user: User?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        user = nil
    }
    
    //Decoding testing
    func testSplitBase64IntoLines() {
        //given
        let base64Encoded = "aGVsbG8=\n"
        //when
        let string = splitBase64IntoLines(base64String: base64Encoded)
        //then
        XCTAssertEqual(string, "hello", "Decoding done right.")
    }
    
    func testUserDoesntHaveRepo() {
        //given
        user = User(name: "scavascava")
        //when
        XCTAssertEqual(user?.repositories.count, 0, "User at the start should not have repositories")
        let dataTask = URLSession.shared.dataTask(with: (user?.userUrl)!) { (data, res, err) in
            if let err = err {
                print(err.localizedDescription)
            }
            guard let data = data else { return }
            
            do {
                
                self.user = try JSONDecoder().decode(User.self, from: data)
            } catch {
                print(err as Any)
            }
        }
        dataTask.resume()
        //then
        XCTAssertEqual(self.user!.repositories.count, 0, "After downloading repo count should still be 0")
    }
    
    func testValidCallToGitHubApi() {
        //given
        user = User(name: "scavascava")
        //1
        let promise = expectation(description: "Status code: 200")
        var statusCode: Int?
        var responseError: Error?
        
        //when
        let dataTask = URLSession.shared.dataTask(with: (user?.userUrl)!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        //3
        waitForExpectations(timeout: 5, handler: nil)
        
        //then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
}
