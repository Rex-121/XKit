////
////  Pages.swift
////  OTC_iOS
////
////  Created by Tyrant on 2019/5/7.
////  Copyright © 2019 Rex. All rights reserved.
////
//
//import Foundation
//
//
//// MARK: - Pages
//
///// 页数
/////
///// - page: 当前页面(page: 目前页码， lines: 此页最多多少数据)
///// - book: 总体情况(page: 当前所在页面，total: 总数据)
//public enum Pages {
//    case page(_ page: Int, _ lines: Int)
//    indirect case book(page: Pages, total: Int)
//}
//
//extension Pages {
//
//    private static let justSize: Int = 10
//
//    private static let singlePage: Pages = Pages.page(1, Pages.justSize)
//
//    /// 封面 .page(0, 20)
//    public static var cover: Pages { return .page(0, justSize) }
//
//    /// 是否是封面 .page(1, _)
//    public var isCover: Bool {
//        return self.pagination <= 1
////        switch self {
////        case .page(let page, _): return page <= 1
////        case .book(page: let page, total: _): return page.isCover
////        }
//    }
//
//    /// 下一页,翻页(页数+1，行数不变)
//    public mutating func turn(_ to: Int? = nil) { self = self.turned(to) }
//
//    /// 下一页,翻页(页数+1，行数不变)
//    public func turned(_ to: Int? = nil) -> Pages {
//        guard let towards = to else { return self + Pages.singlePage }
//        return self + Pages.page(towards, Pages.justSize)
////        switch self {
////            case let .page(p, lines): return .page(to ?? (p + 1), lines)
////            case let .book(page: page, total: total): return .book(page: page.turned(to), total: total)
////        }
//    }
//
//    /// 当前页码
//    public var pagination: Int {
//        switch self {
//        case .page(let a, _): return a
//        case .book(page: let page, _): return page.pagination
//        }
//    }
//
//    /// 此页最多容纳多少条数据/此书总共包含多少条数据
//    public var lines: Int {
//        switch self {
//            case .page(_, let size): return size
//            case .book(_, let total): return total
//        }
//    }
//
//    /// 是否还有更多数据
//    public var outOfPages: Bool {
//        switch self {
//        case .page(_, let lines): return lines <= 0
//        case let .book(page: page, total): return page.lines * page.pagination >= total
//        }
//    }
//
//    /// 单页
//    public var page: Pages {
//        switch self {
//        case .page: return self
//        case .book(page: let p, total: _): return p
//        }
//    }
//}
//
//extension Pages: Equatable {
//
//    private var price: String {
//        switch self {
//        case let .page(page, total):
//            return "\(page.description),\(total.description)"
//        case let .book(page: page, total: total):
//            return "\(page.price),\(total.description)"
//        }
//    }
//
//    public static func == (lhs: Pages, rhs: Pages) -> Bool {
//        return lhs.price == rhs.price
//    }
//
//}
//
//extension Pages: AdditiveArithmetic {
//
//    public static func -= (lhs: inout Pages, rhs: Pages) {
//        lhs = lhs - rhs
//    }
//
//    public static func - (lhs: Pages, rhs: Pages) -> Pages {
//        switch lhs {
//        case let .page(page, lines):
//
//            var c = page - rhs.pagination
//
//            if c < 0 { c = 0 }
//
//            return .page(c, lines)
//
//        case let .book(page: page, total: total):
//
//            return .book(page: page - rhs.page, total: total)
//        }
//    }
//
//
//    public static func += (lhs: inout Pages, rhs: Pages) {
//        lhs = lhs + rhs
//    }
//
//
//    public static func + (lhs: Pages, rhs: Pages) -> Pages {
//        switch lhs {
//        case let .page(page, lines):
//
//            return .page(page + rhs.pagination, lines)
//
//        case let .book(page: page, total: total):
//
//            return .book(page: page + rhs.page, total: total)
//        }
//    }
//
//
//    /// 所有数据均为0 -- *.book(page: .page(0, 0), total: 0)*
//    public static var zero: Pages {
//        return .book(page: .page(0, 0), total: 0)
//    }
//
//
//}
//
