//
//  VertexColor.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public struct VertexColor {
    
    // MARK: - Properties
    
    public var red: UInt8
    
    public var green: UInt8
    
    public var blue: UInt8
    
    public var alpha: UInt8
    
    // MARK: - Initialization
    
    public init(red: UInt8 = 0, green: UInt8 = 0, blue: UInt8 = 0, alpha: UInt8 = 0) {
        
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public init(color: Color, alpha: Float) {
        
        self.red = color.red
        self.green = color.green
        self.blue = color.blue
        self.alpha = UInt8(alpha * Float(225.0))
    }
    
}