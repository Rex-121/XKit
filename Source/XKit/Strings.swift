//
//  File.swift
//  XKit
//
//  Created by Ray on 2018/12/12.
//  Copyright © 2018 Rex. All rights reserved.
//


extension String: XProvider {}
extension XX where Base == String {
    
    /// 是否是邮箱
    public var isEmail: Bool { return NSPredicate(format: "SELF MATCHES %@", "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$").evaluate(with: self.base) }
    
    /// 是否全是数字
    public var isAllInt: Bool {
        var v: Int = 0
        let s = Scanner(string: self.base)
        return s.scanInt(&v) && s.isAtEnd
    }
    
    public var isDecimal: Bool {
        let scanner = Scanner(string: self.base)
        var decimal: Decimal = 0
        return scanner.scanDecimal(&decimal) && scanner.isAtEnd
    }
    
    /// 替代中间的字符串 abcdefg -> ab***fg
    public func middleReplaced(left: Int, right: Int, with: String) -> String {
        var replace = Array(self.base)
        replace.replaceMiddle(left: left, right: right, with: Array(with))
        return String(replace)
    }
    
    /// 是否含有 Emoji
    public var containsEmoji: Bool {
        var contains: Bool = false
        for char in self.base {
            if char.x.isEmoji {
                contains.toggle()
                break
            }
        }
        return contains
    }
    
    
    /// 如果有Eomji, URL转码
    public var encodingForEmoji: String {
        if containsEmoji { return switchEmojiToPercent() }
        return self.base
    }
    
    /// 使用`URL 编码对字符串`Emoji`进行转码
    /// 不转码非Emoji字符
    public func switchEmojiToPercent() -> String {
    
        var new = Array(self.base).map { String($0) }
        
        for (index, char) in self.base.enumerated() {
            
            if char.x.isEmoji {
                let string = String(char)
                let un = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                new[index] = un
            }
            
        }

        return new.joined()
    }
    
    
    /// 抛弃最后无用的 `0`
    ///
    ///     let string = "739124.083000"
    ///     print(string)
    ///     // Prints "739124.083"
    ///     ----------------------------
    ///     let string1 = "739124."
    ///     print(string1)
    ///     // Prints "739124"
    ///
    /// - Complexity: O(n)
    public var drop_0: String {
        return drop_0(self.base)
    }
    
    /// 抛弃最后无用的 `0`
    private func drop_0(_ value: String) -> String {
        /// 如果不包含`.`或者为空，终止条件
        guard value.contains("."), let last = value.last else { return value }
        
        var new = value
        
        switch last {
        case ".", "0": new.removeLast()
        default: return value
        }
        
        return drop_0(new)
    }
    
//    public struct Regex: OptionSet {
//        public init(rawValue: String) {
//            <#code#>
//        }
//
//        public mutating func formUnion(_ other: XX<Base>.Regex) {
//            <#code#>
//        }
//
//        public mutating func formIntersection(_ other: XX<Base>.Regex) {
//            <#code#>
//        }
//
//        public mutating func formSymmetricDifference(_ other: XX<Base>.Regex) {
//            <#code#>
//        }
//
//        public init?(rawValue: String) {
//            <#code#>
//        }
//
//        public var rawValue: String
//
//        public typealias RawValue = String
//
//        public static var lower: Regex { return "a-z" }
////        case capital = "A-Z"
////        case num = "0-9"
////        case chinese = "\\u4e00-\\u9fa5"
//    }
    
//    func regexed(regex: Regex) -> Bool {
//        guard let regex = try? NSRegularExpression(pattern: "", options: .caseInsensitive),
//            let _ = regex.firstMatch(in: self.base, options: [], range: NSRange(location: 0, length: self.base.count))
//            else { return false }
//        return true
//    }
}

extension Character: XProvider {}
extension XX where Base == Character {
    var isEmoji: Bool {
        for scalar in self.base.unicodeScalars {
            switch scalar.value {
            case
            0x00A0...0x00AF,
            0x2030...0x204F,
            0x2120...0x213F,
            0x2190...0x21AF,
            0x2310...0x329F,
            0x1F000...0x1F9CF:
                return true
            default:
                continue
            }
        }
        return false
    }
}


extension UIColor: XProvider {}
extension XX where Base == UIColor {
    /// 颜色的hex string value
    public var hex: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.base.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
