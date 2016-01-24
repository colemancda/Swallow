//
//  Point.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Kronos

/// Describes a two dimensional point or vector.
public struct Point {
    
    // MARK: - Properties
    
    public var x: Float
    
    public var y: Float
    
    // MARK: - Intialization
    
    public init(x: Float = 0, y: Float = 0) {
        
        self.x = x
        self.y = y
    }
    
    // MARK: - Conversion
    
    public init(vector: Vector2) {
        
        self.x = vector.x
        self.y = vector.y
    }
    
    public var vector: Vector2 {
        
        return Vector2(x, y)
    }
}