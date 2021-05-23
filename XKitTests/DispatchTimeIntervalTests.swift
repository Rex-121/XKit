//
//  DispatchTimeIntervalTests.swift
//  XKitTests
//
//  Created by Tyrant on 2019/11/2.
//  Copyright © 2019 Rex. All rights reserved.
//

import XCTest

class DispatchTimeIntervalTests: XCTestCase {


    func testExample() {
     
        assert(DispatchTimeInterval.aHour == .seconds(3600))

        assert(DispatchTimeInterval.aMinute == .seconds(60))
        
        assert(DispatchTimeInterval.minutes(10) == .seconds(600))
    }
    
    
    
}
