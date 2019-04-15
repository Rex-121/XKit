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
    
    /// 集合走中间向两边污染
    func testRangeReplace() {
        
        var array = Array("1")
        array.replaceMiddle(left: 1, right: 1, with: "***")
        assert(array == ["*", "*", "*"])
        
    }


    /// 集合走两边向中间污染
    func testKeep() {
        
        let a = Array("1234567890").keep(left: 5, right: 3, replaced: "****")

        assert(a == ["1", "2", "3", "4", "5", "*", "*", "*", "*", "8", "9", "0"])
        assert([4].keep(left: 9, right: 3, replaced: [1,5]) == [4, 1, 5])
        
        
        assert([Int]().keep(left: -10, right: 3, replaced: [1,2,3,4,5]) == [1, 2, 3, 4, 5])
        
        assert([1,4].keep(left: 0, right: 1, replaced: [1,2,3,4,5]) == [1, 2, 3, 4, 5, 4])
        
    }
    
    
    /// 测试取下标元素
    func testElementAt() {
        
        let array = [1,2,3,4,5,6,7]
                
        assert(array.element(at: array.count) == nil)
        
        assert(array.element(at: 1) == 2)
        
    }
    
    func testNonEmpty() {
        assert([Int]().nonEmpty == nil)
        let array: [Int]? = nil
        assert(array?.nonEmpty == nil)
        
        assert([1].nonEmpty == [1])
    }
}
