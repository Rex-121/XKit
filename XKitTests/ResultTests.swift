//
//  ResultTests.swift
//  XKitTests
//
//  Created by Tyrant on 2019/11/2.
//  Copyright © 2019 Rex. All rights reserved.
//

import XCTest

class ResultTests: XCTestCase {

    enum Wrong: Error {
        case wrong
    }
    
    /// 测试 可能的success值
    func testValue() {
        print("测试 可能的success值")
        let result = Result<Int, Wrong>.success(10)
        
        assert(result.x.success! == 10)
        
        assert(result.x.failure == nil)
        
    }
    
    /// 测试 可能的failure值
    func testFailure() {
        print("测试 可能的failure值")
        let result = Result<Int, Wrong>.failure(.wrong)
        
        assert(result.x.success == nil)
        
        assert(result.x.failure == .wrong)
        
    }

}
