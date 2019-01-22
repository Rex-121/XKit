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



// MARK: - RangeReplaceableCollection
extension RangeReplaceableCollection where Element: Comparable {
    
    public mutating func addition(partition: Self.Element, add: Int, new: Self.Element) {
        // 如果没有发现 Element 直接补全剩下的add
        let f = self.firstIndex { $0 == partition }
        guard let first = f else {
            // 增加分割线
            append(partition)
            // 补全
            return self.plus(plus: add, new: new)
        }
        // 需要补全的个数
        let left = distance(from: first, to: endIndex) - 1
        // 补全
        self.plus(plus: add - left, new: new)
        
    }
    
    
    /// 补全
    ///
    /// - Parameters:
    ///   - plus: 需要补全的个数
    ///   - new: 填充的物品
    /// - Returns: 补全
    public mutating func plus(plus: Int, new: Self.Element) {
        if plus <= 0 { return }
        for _ in 0..<plus {
            append(new)
        }
    }
    
}
