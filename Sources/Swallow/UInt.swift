//
//  UInt.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/24/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public extension UInt {
    
    /// The next power of two.
    ///
    /// Examples:
    /// - If "value" is 15, it will return 16.
    /// - If "value" is 16, it will return 16.
    /// - If "value" is 17, it will return 32.
    ///
    /// - Returns: the Next Power of Two value.
    var nextPowerOfTwo: UInt {
        
        var x = self
        
        x = x - 1
        
        x = x | (x >> 1)
        
        x = x | (x >> 2)
        
        x = x | (x >> 4)
        
        x = x | (x >> 8)
        
        x = x | (x >> 16)
        
        return x + 1
    }
}