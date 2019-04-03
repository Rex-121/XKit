//
//  StringTests.swift
//  XKitTests
//
//  Created by Ray on 2019/3/27.
//  Copyright © 2019 Rex. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    /// FIXME: 缺乏测试用例
    func testDrop_0() {
        
        let string = "jlaer."
        
        let s = string.x.drop_0
        
        print(s)
        
    }
    
    func testReplaceM() {
        
        let s = "".x.middleReplaced(left: 3, right: 3, with: "******")
        print(s)
        let s1 = "1".x.middleReplaced(left: 3, right: 3, with: "******")
        print(s1)
    }
    
    func testReg() {
        
        let value = "abcGGFefG"//然了^$&*^!abcdefg"
        
        let a = "🐶".data(using: .utf8)
        print(a ?? "")
        
        let aa = "🐶".data(using: .utf16)
        print(aa ?? "")
        
        let usFlag: Character = "\u{1F1FA}"
        let k: Character = "\u{1F1F8}"
        print(usFlag, k)
        
        let regex = try? NSRegularExpression(pattern: "\\w", options: .caseInsensitive)
        //        [a-zA-Z0-9\\u4e00-\\u9fa5]{2,8}
        let res = regex?.matches(in: value, options: [], range: NSRange(location: 0, length: value.count))
        let g = regex?.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count))
        print(g ?? "false")
        print(res?.count ?? "none")
    }

}
