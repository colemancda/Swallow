//
//  Float.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public extension Float {
    
    static var epsilon: Float { return 0.0001 }
    
    func epsilonEqual(rhs: Float) -> Bool {
        
        return fabsf(self - rhs) < Float.epsilon
    }
    
    var square: Float {
        
        return self * self
    }
    
    func clamp(min minValue: Float, max maxValue: Float) -> Float {
        
        return min(maxValue, max(self, minValue))
    }
}