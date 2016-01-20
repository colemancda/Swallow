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
    
}