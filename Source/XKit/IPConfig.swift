//
//  IPConfig.swift
//  XKit
//
//  Created by Tyrant on 2019/8/22.
//  Copyright © 2019 Rex. All rights reserved.
//

import Foundation


public func getPrivateIPAddress() -> String {
    var address : String?
    
    // Get list of all interfaces on the local machine:
    var ifaddr : UnsafeMutablePointer<ifaddrs>?
    guard getifaddrs(&ifaddr) == 0 else { return "" }
    guard let firstAddr = ifaddr else { return "" }
    
    // For each interface ...
    for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
        let interface = ifptr.pointee
        
        // Check for IPv4 or IPv6 interface:
        let addrFamily = interface.ifa_addr.pointee.sa_family
        if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
            
            // Check interface name:
            let name = String(cString: interface.ifa_name)
            if  name == "en0" || name == "en2" || name == "en3" || name == "en4" || name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2" || name == "pdp_ip3"{
                
                // Convert interface address to a human readable string:
                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                            &hostname, socklen_t(hostname.count),
                            nil, socklen_t(0), NI_NUMERICHOST)
                address = String(cString: hostname)
            }
        }
    }
    freeifaddrs(ifaddr)
    return address ?? ""
}


public func getPublicIPAddress() -> String {
    /// http://ifconfig.me/ip
    /// https://checkip.amazonaws.com/
    let url = URL(string: "http://ifconfig.me/ip")
    var ipAddress: String? = nil
    do {
        if let url = url {
            ipAddress = try String(contentsOf: url, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        }
    } catch {
    }
    return ipAddress ?? ""
}
