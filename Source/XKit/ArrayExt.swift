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
