//
//  EncryptTests.swift
//  XKitTests
//
//  Created by Ray on 2018/12/11.
//  Copyright © 2018 Rex. All rights reserved.
//

import XCTest

class EncryptTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
                
        XCTAssertTrue("1234567890".x.md5 == "e807f1fcf82d132f9bb018ca6738a19f")
        
        XCTAssertTrue("hello, world".x.md5 == "e4d7f1b4ed2e42d15898f4b27b019da4")
        
        
        let code = "0x2600"
        
        // 1.从字符串中取出十六进制的数
        // 创建一个扫描器, 扫描器可以从字符串中提取我们想要的数据
        let scanner = Scanner(string: code)
        
        // 2.将十六进制转换为字符串
        var result:UInt32 = 0
        scanner.scanHexInt32(&result)
        
        // 3.将十六进制转换为emoji字符串
        let emojiStr = Character(UnicodeScalar(result)!)
        
        // 3.显示
        print(emojiStr)
        
        let g = "🔼🥚😘💪😕🇮🇱🇪🇭🇮🇩🇭🇰🇮🇱🇺🇦🎆🏙💒🏞🌅🕋📝📗🖊📘❄️💥🌩👨🏿‍💻jji脚底板 v 的"
        print(g.x.containsEmoji)
        print(code.x.containsEmoji)
        
        
        let ggggg = "🔼我是中文🏞English🌩👨💻"

        
        print(ggggg.x.switchEmojiToPercent())
//        g.forEach { print(String($0) + String($0).x.containsEmoji.description) }
        
  
    }

}
