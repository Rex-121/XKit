//
//  ArrayTests.swift
//  XKitTests
//
//  Created by Ray on 2019/1/15.
//  Copyright © 2019 Rex. All rights reserved.
//

import XCTest

class ArrayTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
       
        let a = Int.random(in: 0...0)
        let toB = Int.random(in: a...200)
        
        let composite = [Int](a...toB).composite(by: 10)
        
        print(composite)
        
        let composite2 = [Int](10...30).composite(by: 5)
        XCTAssertTrue(composite2 == [10, 15, 20, 25, 30])
        
        let composite3 = [Int](10...30).composite(by: 1)
        print(composite3)
//        XCTAssertTrue(composite2 == [10, 15, 20, 25, 30])
        
    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
