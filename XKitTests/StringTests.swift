//
//  StringTests.swift
//  XKitTests
//
//  Created by Ray on 2019/3/27.
//  Copyright © 2019 Rex. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {

    
    func testDrop_0() {
        
        assert("jlaer.".x.drop_0 == "jlaer")
        
        assert("1234.00".x.drop_0 == "1234")
        
        assert("1234.01".x.drop_0 == "1234.01")
        
    }
    
    func testReplaceM() {
        
        let s = "".x.middleReplaced(left: 3, right: 3, with: "******")
        assert(s == "******")
        let s1 = "1".x.middleReplaced(left: 3, right: 3, with: "******")
        assert(s1 == "******")
        
        let s2 = "12345678".x.middleReplaced(left: 3, right: 2, with: "----")
        assert(s2 == "1----8")
        
        let s3 = "123456789".x.middleReplaced(left: 3, right: 3, with: "-")
        assert(s3 == "1-9")
    }

    
    func testIsDecimal() {
        let bool = """
56007123984712398657812396478123659123649612895612349861239786598123651234.5
""".x.isDecimal
        
        assert(bool)
    }
    
    func testIsEmail() {
        assert("1234@163.com".x.isEmail)
        assert(!"1234@.com".x.isEmail)
    }
    
    func testIsAllInt() {
        assert("12345".x.isAllInt)
        assert("123417936127865".x.isAllInt)
        assert(!"12345g".x.isAllInt)
    }
    
    
    func testEmoji() {
        assert("🔼我是中文🏞English🌩👨💻".x.encodingForEmoji == "%F0%9F%94%BC我是中文%F0%9F%8F%9EEnglish%F0%9F%8C%A9%F0%9F%91%A8%F0%9F%92%BB")
    }
    
    func testKeep() {
        assert("g".x.keep(left: 3, right: 3, with: "***") == "g***")
        
        assert("12345678".x.keep(left: 3, right: 3, with: "-") == "123-678")
    }
    
    
    func testHex() {
        assert(UIColor.white.x.hex == "FFFFFF")
    }
    
    func testAl() {
        
        assert("gasr".x.first_alphabet == "g")
        
        assert("王".x.first_alphabet == "w")
        
        assert("舍".x.first_alphabet == "s")
        
        assert("广安市".x.first_alphabet == "g")
        assert("他".x.first_alphabet == "t")
         
        assert("$他".x.first_alphabet == "$")
        
    }
}
