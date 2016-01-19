//
//  Rectangle.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Describes a rectangle by its top-left corner point (x, y) and by its width and height.
public struct Rectangle {
    
    // MARK: - Properties
    
    public var x: Float
    
    public var y: Float
    
    public var width: Float
    
    public var height: Float
    
    // MARK: - Initialization
    
    public init(x: Float, y: Float, width: Float, height: Float) {
        
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    public init() {
        
        self.x = 0
        self.y = 0
        self.width = 0
        self.height = 0
    }
}

// MARK: - Darwin Support