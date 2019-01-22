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
    

}
