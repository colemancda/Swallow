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
        
        for color in TestColors {
            
            let color2 = Color(red: color.red, green: color.green, blue: color.blue)
            
            XCTAssert(color == color2, "\(color) == \(color2)")
            
            XCTAssert(color.blue == color2.blue)
            
            XCTAssert(color.red == color2.red)
            
            XCTAssert(color.green == color2.green)
            
            XCTAssert(color.alpha == color2.alpha)
            
            // alpha is 0 by default
            XCTAssert(color.alpha == UInt8.min)
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
        
        do {
            
            for color in TestColors {
                
                let color2 = Color(alpha: 75, red: color.red, green: color.green, blue: color.blue)
                
                XCTAssert(color.equalColor(color2))
                
                XCTAssert(color != color2, "\(color) != \(color2)")
                
                XCTAssert(color.blue == color2.blue)
                
                XCTAssert(color.red == color2.red)
                
                XCTAssert(color.green == color2.green)
                
                XCTAssert(color.alpha != color2.alpha)
            }
        }
        
        do {
            
            // test alpha initialization values
            
            for color in TestColors {
                
                for i in 0 ... 255 {
                    
                    let newColor = Color(alpha: UInt8(i), red: color.red, green: color.green, blue: color.blue)
                    
                    XCTAssert(color.equalColor(newColor))
                }
            }
        }
    }
    
    func testAllColors() {
        
        var count = 0
        
        let range = UInt8.min ..< UInt8.max
        
        for red: UInt8 in range {
            
            for blue: UInt8 in range {
                
                for green: UInt8 in range {
                    
                    // create color
                    
                    let _ = Color(red: red, green: green, blue: blue)
                    
                    count += 1
                    
                    // try creating all alpha values just to test
                    for alpha: UInt8 in range {
                        
                        let alphaColor = Color(alpha: alpha, red: red, green: green, blue: blue)
                        
                        XCTAssert(alphaColor.alpha == alpha)
                    }
                }
            }
        }
        
        print("\(count) possible colors")
    }
}

// MARK: - Constants

let TestColors: [Color] = [
    Color.white,
    Color.silver,
    Color.gray,
    Color.black,
    Color.red,
    Color.maroon,
    Color.yellow,
    Color.olive,
    Color.lime,
    Color.green,
    Color.aqua,
    Color.teal,
    Color.blue,
    Color.navy,
    Color.fuchsia,
    Color.purple
]


