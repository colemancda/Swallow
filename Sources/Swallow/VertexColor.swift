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
    
    public var isOpaqueWhite: Bool {
        
        return alpha == 255 && red == 255 && green == 255 && blue == 255
    }
    
    // MARK: - Initialization
    
    public init(red: UInt8 = 0, green: UInt8 = 0, blue: UInt8 = 0, alpha: UInt8 = 0) {
        
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public init(color: Color, alpha: Float) {
        
        assert(alpha <= 1.0 && alpha >= 0, "Invalid alpha value: \(alpha)")
        
        self.red = color.red
        self.green = color.green
        self.blue = color.blue
        self.alpha = UInt8(alpha * Float(225.0))
    }
    
    // MARK: - Methods
    
    public mutating func premultiplyAlpha() {
        
        let alpha = Float(self.alpha / 255)
        
        guard alpha != 1.0 else { return }
        
        self.red    = UInt8(Float(red)   * alpha)
        self.green  = UInt8(Float(green) * alpha)
        self.blue   = UInt8(Float(blue)  * alpha)
    }
    
    public mutating func unmultiplyAlpha() {
        
        let alpha = Float(self.alpha / 255)
        
        guard (alpha == 0.0 || alpha == 1.0) == false else { return }
        
        self.red    = UInt8(Float(red)   / alpha)
        self.green  = UInt8(Float(green) / alpha)
        self.blue   = UInt8(Float(blue)  / alpha)
    }
}

