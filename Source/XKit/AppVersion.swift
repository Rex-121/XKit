//
//  AppVersion.swift
//  XFoundation_Swift
//
//  Created by Ray on 2018/12/4.
//  Copyright © 2018 Rex. All rights reserved.
//

import Foundation

public typealias AppVersion = OperatingSystemVersion
extension Bundle: XProvider {}
extension XX where Base == Bundle {
    /// app 版本号 eg: 1.0.0
    public var appVersion: AppVersion {
        
        if let info = self.base.infoDictionary {
            let v = info["CFBundleShortVersionString"] as? String ?? ""
            return AppVersion(stringWithDot: v)
        }
        return AppVersion(majorVersion: 0, minorVersion: 0, patchVersion: 0)
    }
    
    /// app build号
    public var buildVersion: String {
        if let info = self.base.infoDictionary, let build = info["CFBundleVersion"] as? String {
            return build
        }
        return ""
    }
    
    /// app build号
    public var appName: String {
        if let info = self.base.infoDictionary, let name = info["CFBundleDisplayName"] as? String {
            return name
        }
        return ""
    }
}

//MARK: - AppInfo
open class AppInfo {
    
    /// 版本号
    public static var vesion: String {
        return Bundle.main.x.appVersion.versionString
    }
    
    /// build
    public static var build: String {
        return Bundle.main.x.buildVersion
    }
    
    /// 应用名称
    public static var appName: String {
        return Bundle.main.x.appName
    }
    
}

extension AppVersion: Comparable {
    public static func == (lhs: AppVersion, rhs: AppVersion) -> Bool {
        return lhs.tupleVersion == rhs.tupleVersion
    }
    
    public static func < (lhs: AppVersion, rhs: AppVersion) -> Bool {
        return lhs.tupleVersion < rhs.tupleVersion
    }
}

extension AppVersion {
    
    public init(stringWithDot string: String) {
        
        let array = string.components(separatedBy: ".").map { Int($0) ?? 0 }
        self.init(majorVersion: array.first!,
                  minorVersion: array.second ?? 0,
                  patchVersion: array.third ?? 0)
        
    }
    
    fileprivate var tupleVersion: (Int, Int, Int) {
        return (majorVersion, minorVersion, patchVersion)
    }
    
    /// 版本号  eg: 0.0.0
    public var versionString: String {
        return "\(majorVersion).\(minorVersion).\(patchVersion)"
    }
    
}



/// 操作系统
///
/// - Returns: 操作系统
public func osName() -> String {
    #if os(iOS)
    return "iOS"
    #elseif os(watchOS)
    return "watchOS"
    #elseif os(tvOS)
    return "tvOS"
    #elseif os(macOS)
    return "OS X"
    #elseif os(Linux)
    return "Linux"
    #else
    return "Unknown"
    #endif
}
