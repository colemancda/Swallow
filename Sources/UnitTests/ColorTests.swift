//
//  ColorTests.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import XCTest
import Swallow

final class ColorTests: XCTestCase {
    
    func testEquality() {
        
        do {
            
            let color1 = Color.blue
            
            let color2 = Color(red: 0, green: 0, blue: UInt8.max)
            
            let rawValue: CUnsignedInt = 0x0000ff
            
            XCTAssert(color1 == color2, "\(color1) == \(color2)")
            
            XCTAssert(color1.value == rawValue)
            
            XCTAssert(color1.blue == UInt8.max, "\(color1) == \(UInt8.max)")
        }
    }
    
    func testColorEquality() {
        
        do {
            
            let color1 = Color.blue
            
            let color2 = Color(alpha: UInt8.max, red: 0, green: 0, blue: UInt8.max)
            
            let rawValue: CUnsignedInt = 0x0000ff
            
            XCTAssert(color1 != color2, "\(color1) != \(color2)")
            
            XCTAssert(color1.value == rawValue)
            
            XCTAssert(color2.value != rawValue)
            
            XCTAssert(color1.blue == UInt8.max, "\(color1) == \(UInt8.max)")
            
            XCTAssert(color2.blue == UInt8.max, "\(color1) == \(UInt8.max)")
            
            XCTAssert(color1.alpha == UInt8.min)
            
            XCTAssert(color2.alpha == UInt8.max)
            
            XCTAssert(color1.equalColor(color2))
        }
    }
    
}