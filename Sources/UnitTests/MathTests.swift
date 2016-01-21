//
//  MathTests.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import XCTest
import Swallow

final class MathTests: XCTestCase {
    
    func testMathTypeSizes() {
        
        // Vectors
        XCTAssert(sizeof(Vector2) == (sizeof(Float) * 2))
        XCTAssert(sizeof(Vector2) == (sizeof((Float, Float).self)))
        
        XCTAssert(sizeof(Vector3) == (sizeof(Float) * 3))
        XCTAssert(sizeof(Vector3) == (sizeof((Float, Float, Float).self)))
        
        XCTAssert(sizeof(Vector4) == (sizeof(Float) * 4))
        XCTAssert(sizeof(Vector4) == (sizeof((Float, Float, Float, Float).self)))
        
        // Matrices
        XCTAssert(sizeof(Matrix3) == (sizeof(Float) * 9))
        
        XCTAssert(sizeof(Matrix4) == (sizeof(Float) * 16))
    }
}