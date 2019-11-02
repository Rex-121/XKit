//
//  ResultExt.swift
//  XKit
//
//  Created by Tyrant on 2019/11/2.
//  Copyright © 2019 Rex. All rights reserved.
//

import Foundation

extension Result: XProvider { }

public extension XX where Base: ResultProtocol {

    /// 可能的`success`值
    var success: Base.Success? {
        return base.successValue()
    }
    
    
    /// 可能的`failure`值
    var failure: Base.Failure? {
        do {
            let _ = try base.result.get()
            return nil
        } catch {
            return error as? Base.Failure
        }
    }
    
}

public protocol ResultProtocol {
    associatedtype Success
    associatedtype Failure: Swift.Error
    
    /// 可能的`success`值
    func successValue() -> Success?
    
    var result: Result<Success, Failure> { get }
}


extension Result: ResultProtocol {
    
    public func successValue() -> Success? {
        return try? result.get()
    }

    public var result: Result<Success, Failure> {
        return self
    }
    
}
