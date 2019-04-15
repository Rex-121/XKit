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
    
    
    /// 是否为空，则为 `nil`
    /// 如果不为空 则返回 `self`
    public var nonEmpty: Self? {
        return isEmpty ? nil : self
    }
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

extension RandomAccessCollection {
    
    /// `index` 下的元素
    ///
    /// - Parameter index: 下标
    /// - Returns: Element
    public func element(at index: Index) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
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

/// FIXME: 尚无Test 算法问题
extension Array where Element == Character {
    
    
    
    /// 以`中心`开始替换左右元素
    ///
    /// - Parameters:
    ///   - left: 替换到 左侧`left`个元素
    ///   - right: 替换到 右侧`left`个元素
    ///   - collection: 用来替换的元素
    public mutating func replaceMiddle<C>(left: Index, right: Index, with collection: C) where C : Collection, Character == C.Element {
        
        // 如果自身为空，直接添加新数据
        if isEmpty {
            self.append(contentsOf: collection)
            return
        }

        let middle = self.endIndex / 2
        var range = middle - left...middle + right
        
        /// 处理越界情况
        if range.lowerBound <= startIndex {
            range = startIndex...range.upperBound
        }
        /// 处理越界情况
        if range.upperBound >= endIndex {
            range = range.lowerBound...endIndex - 1
        }
        
        self.replaceSubrange(range, with: collection)
    }
}



extension Array  {

    /// 保留左右两边元素，替换中间元素
    ///
    ///     let stirngs = Array("1234567890").keep(left: 5, right: 3, replaced: "****")
    ///     print(stirngs)
    ///     // Prints "["1", "2", "3", "4", "5", "*", "*", "*", "*", "8", "9", "0"]"
    ///
    ///     let ints = [4].keep(left: 9, right: 3, replaced: [1,5]))
    ///     print(ints)
    ///     // Prints "[4, 1, 5]"
    ///
    ///     let empty = [Int]().keep(left: -10, right: 3, replaced: [1,2,3,4,5])
    ///     print(empty)
    ///     // Prints "[1, 2, 3, 4, 5]"
    ///
    ///     let intss = [1,4].keep(left: 0, right: 1, replaced: [1,2,3,4,5]))
    ///     print(intss)
    ///     // Prints "[1, 2, 3, 4, 5, 4]"
    /// - Parameters:
    ///   - left: 左侧保留到`n`
    ///   - right: 右侧保留到`n`
    ///   - replaced: 替换物
    /// - Returns: [Element]
    /// - Complexity: O(m) on average, where m is the length of replaced
    public func keep<S>(left: Int, right: Int, replaced: S) -> [Element] where Element == S.Element, S : Sequence {
        
        /// 如果为空 直接返回替代品
        if self.isEmpty { return Array(replaced) }
        
        let offset = (left >= 0 ? left : 0)
        
        /// 左侧开始位置 防止越界
        let startAt = self.index(startIndex, offsetBy: offset, limitedBy: endIndex) ?? 1
     
        /// 初始化左侧值
        var leftValues = self[startIndex..<startAt]
        /// 直接添加替代品
        leftValues.append(contentsOf: replaced)
        
        /// 如果已经是数组末尾，直接返回
        if startAt == endIndex { return Array(leftValues) }
        
        
        guard let rightAt = self.index(endIndex, offsetBy: -right, limitedBy: startAt) else {
            /// 如果 `rightAt` 的起始位置已经被 `startAt` 包含了
            return Array(leftValues + self[startAt..<endIndex])
        }
        
        if !indices.contains(rightAt) {
            /// 如果右侧越界 直接返回
            return Array(leftValues)
        }
        
        return Array(leftValues + self[rightAt..<endIndex])
    }
    
    
}
