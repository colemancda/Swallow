//
//  Float.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

extension Float: AlmostEquatable {
    
    public func almostEqual(rhs: Float, tolerance: Float = FloatEpsilon) -> Bool {
        
        return fabsf(self - rhs) < tolerance
    }
}

public extension Float {
    
    var square: Float {
        
        return self * self
    }
    
    func clamp(min minValue: Float, max maxValue: Float) -> Float {
        
        return min(maxValue, max(self, minValue))
    }
}
