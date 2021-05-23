//
//  DispatchTimeInterval_Ext.swift
//  XKit
//
//  Created by Tyrant on 2019/10/16.
//

import Foundation

public extension DispatchTimeInterval {
    
    
    /// 一分钟
    static var aMinute: DispatchTimeInterval {
        return minutes(1)
    }
    
    /// (n)分钟
    static func minutes(_ minute: Int) -> DispatchTimeInterval {
        return .seconds(60 * minute)
    }
    
    
    /// 1个小时
    static var aHour: DispatchTimeInterval {
        return minutes(60)
    }
    
}
