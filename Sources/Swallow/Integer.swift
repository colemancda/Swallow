//
//  Integer.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

// MARK: - Bitwise Math

public extension Int {
    
    @inline(__always) func shiftAndRotate(shift: Int) -> Int {
        
        return (self << 1) | (self >> ((sizeof(Int) * Int(CHAR_BIT)) - shift))
    }
}