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

    
    func testAddition() {
        
        var string = "12345"
        
        string.addition(partition: ".", add: 4, new: "0")
        XCTAssertTrue(string == "12345.0000")
        
        var array = [1,4,5,6,7]
        array.addition(partition: 5, add: 4, new: 0)
        XCTAssertTrue(array == [1,4,5,6,7,0,0])
        
        
        var string1 = "12345.1"
        
        string1.addition(partition: ".", add: 1, new: "0")
        XCTAssertTrue(string1 == "12345.1")
        
    }
    
    
    func testRangeReplace() {
        
        var should = "1"
        
        var array = Array(should)
        array.replaceMiddle(left: 1, right: 1, with: "***")
        
        print(array)
//        let aa = array.replaceMiddle(left: 1, right: 1, with: ["***"])
    }


    func testRangeFl() {
        
        let a = Array("1234567890").keep(left: 5, right: 3, replaced: "****")
        print(a)

        print([4].keep(left: 9, right: 3, replaced: [1,5]))
        
        
        print([Int]().keep(left: -10, right: 3, replaced: [1,2,3,4,5]))
        
        print([1,4].keep(left: 0, right: 1, replaced: [1,2,3,4,5]))
        
    }
}
