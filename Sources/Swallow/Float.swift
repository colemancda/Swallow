//
//  Float.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

// MARK: - Epsilon Equality

public extension Float {
    
    static var epsilon: Float { return 0.0001 }
    
    func epsilonEqual(rhs: Float) -> Bool {
        
        return fabsf(self - rhs) < Float.epsilon
    }
}

// MARK: - Square

public extension Float {
    
    var square: Float {
        
        return self * self
    }
}