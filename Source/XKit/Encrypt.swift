//
//  Encrypt.swift
//  XKit
//
//  Created by Ray on 2018/12/11.
//  Copyright © 2018 Rex. All rights reserved.
//

public protocol XProvider { }
extension XProvider {
    /// 代理`self`方法
    public var x: XX<Self> {
        return XX(self)
    }
    
    /// 代理`self`类方法
    public static var X: XX<Self>.Type {
        return XX<Self>.self
    }
}


public struct XX<Base> {
    
    /// `Base`指明此代理类别
    public let base: Base
    
    /// 创建代理类别
    ///
    /// - parameters:
    ///   - base: 被代理的类别
    fileprivate init(_ base: Base) {
        self.base = base;
    }
}

import CommonCrypto

extension XX where Base == String {
    
    /// md5 加密 32位【小】
    ///
    /// - Returns: md5字符串
    public var md5: String { return XKit.Md5(self.base) }
}



/// md5 加密 32位【小】
///
/// - Parameter str: 需要加密的字符串
/// - Returns: md5字符串
fileprivate func Md5(_ str: String) -> String {
    if str.isEmpty { return "" }
    
    let cchar = str.cString(using: .utf8)! // [CChar]
    let k = str.lengthOfBytes(using: .utf8) // Int
    let strLen = CUnsignedInt(k)
    let digestLen = Int(CC_MD5_DIGEST_LENGTH)
    let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
    
    defer {
        result.deinitialize(count: digestLen)
    }
    
    CC_MD5(cchar, strLen, result)
    
    var final = ""
    for i in 0 ..< digestLen {
        final = final.appendingFormat("%02x", result[i])
    }
    return final
}

