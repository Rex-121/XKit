//
//  ArrayExt.swift
//  XFoundation_Swift
//
//  Created by Ray on 2018/12/4.
//  Copyright © 2018 Rex. All rights reserved.
//

import Foundation

extension Collection {
    
    /// The second element of the collection.
    ///
    /// If the collection is empty, the value of this property is `nil`.
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     if let secondNumber = numbers.second {
    ///         print(secondNumber)
    ///     }
    ///     // Prints "20"
    public var second: Self.Element? { return self.dropFirst().first }
    
    /// The third element of the collection.
    ///
    /// If the collection is empty, the value of this property is `nil`.
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     if let thirdNumber = numbers.third {
    ///         print(thirdNumber)
    ///     }
    ///     // Prints "30"
    public var third: Self.Element? { return self.dropFirst(2).first }
    
}


extension Collection where Element == Int {
    
    /* 合数指自然数中除了能被1和本身整除外，还能被其他数（0除外）整除的数。
     * 与之相对的是质数，而1既不属于质数也不属于合数。最小的合数是4。
     * 其中，完全数与相亲数是以它为基础的。
     */
    
    
    /// 可以被整除的数
    ///
    /// - Parameter int: 整除的基数
    /// - Discussion: 目前不会移除原数据里的0
    /// - Returns: [可以被整除的数]
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    public func composite(by int: Int) -> [Int] {
        if int == 0 { return [] }
        if int == 1 { return Array(self) }
        return self.filter { $0 % int == 0 }
    }
    
}
