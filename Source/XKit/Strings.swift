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
    
    /// 替代中间的字符串 abcdefg -> ab***fg
    public func middleReplaced(left: Int, right: Int, with: String) -> String {
        var replace = Array(self.base)
        replace.replaceMiddle(left: left, right: right, with: Array(with))
        return String(replace)
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
