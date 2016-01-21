//
//  Vector4.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A representation of a 4-component vector.
public struct Vector4: OpenGLMathType {
    
    // MARK: - Properties
    
    public var value: (Float, Float, Float, Float)
    
    // MARK: - Initialization
    
    @inline(__always)
    public init(_ x: Float, _ y: Float, _ z: Float, _ w: Float) {
        
        self.value = (x, y, z, w)
    }
}