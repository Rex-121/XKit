//
//  TestsAppVersion.swift
//  XSFoundation_Tests
//
//  Created by Ray on 2018/12/4.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

import XKit

class TestsAppVersion: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
       
        print(Bundle.main.x.appVersion.versionString)
        
        let aVersion = AppVersion(stringWithDot: "1.0.3")
        let bVersion = AppVersion(stringWithDot: "1.0.6")
        
        XCTAssertTrue(aVersion == AppVersion(stringWithDot: "1.0.3"))
        
        XCTAssertFalse(aVersion == bVersion)
        XCTAssertTrue(aVersion != bVersion)
        XCTAssertTrue(aVersion < bVersion)
        XCTAssertTrue(aVersion <= bVersion)
        XCTAssertTrue(aVersion <= aVersion)
        XCTAssertTrue(bVersion >= aVersion)
        XCTAssertTrue(bVersion >= bVersion)
        XCTAssertTrue(bVersion > aVersion)
        
        
        let k = aVersion...bVersion
        XCTAssertTrue(k.contains(AppVersion(stringWithDot: "1.0.4")))
        XCTAssertFalse(k.contains(AppVersion(stringWithDot: "4.9")))
        
        XCTAssertTrue(osName() == "iOS")
    }
    
    
    func testLose() {
        
        let a = AppVersion(stringWithDot: "1.0")
        let b = AppVersion(stringWithDot: "2")
        let c = AppVersion(stringWithDot: "")
        XCTAssertTrue(a < b)
        XCTAssertTrue(c < a)
        
    }
    
    

}
