//
//  XKitTests.swift
//  XKitTests
//
//  Created by Ray on 2018/12/5.
//  Copyright © 2018 Rex. All rights reserved.
//

import XCTest
@testable import XKit


class XKitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let bool = "56007123984712398657812396478123659123649612895612349861239786598123651234.5".x.isDecimal
        
        print(bool)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
