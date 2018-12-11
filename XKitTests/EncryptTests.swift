//
//  EncryptTests.swift
//  XKitTests
//
//  Created by Ray on 2018/12/11.
//  Copyright © 2018 Rex. All rights reserved.
//

import XCTest

class EncryptTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
                
        XCTAssertTrue("1234567890".x.md5 == "e807f1fcf82d132f9bb018ca6738a19f")
        
        XCTAssertTrue("hello, world".x.md5 == "e4d7f1b4ed2e42d15898f4b27b019da4")
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
