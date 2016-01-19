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
    
    public init(x: Float = 0, y: Float = 0, width: Float = 0, height: Float = 0) {
        
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    // MARK: - Methods
    
    public func contains(x: Float, y: Float) -> Bool {
        
        return x >= self.x && y >= self.y && x <= self.x + self.width && y <= self.y + self.height
    }
    
    public func contains(point: Point) {
        
        self.contains(point.x, y: point.y)
    }
    
    public func contains(rectangle: Rectangle) -> Bool {
        
        let rX = rectangle.x
        let rY = rectangle.y
        let rWidth = rectangle.width
        let rHeight = rectangle.height
        
        return rX >= self.x
            && rX + rWidth <= self.x + self.width
            && rY >= self.y && rY + rHeight <= self.y + self.height
    }
    
    public func intersects(rectangle: Rectangle) -> Bool {
        
        let rX = rectangle.x
        let rY = rectangle.y
        let rWidth = rectangle.width
        let rHeight = rectangle.height
        
        let outside = (rX <= self.x && rX + rWidth <= self.x)
            || (rX >= self.x + self.width && rX + rWidth >= self.x + self.width)
            || (rY <= self.y && rY + rHeight <= self.y)
            || (rY >= self.y + self.height && rY + rHeight >= self.y + self.height)
        
        return !outside
    }
    
    public func intersection(rectangle: Rectangle) -> Rectangle? {
        
        let left    = max(x, rectangle.x)
        let right   = min(x + width, rectangle.x + rectangle.width)
        let top     = max(y, rectangle.y)
        let bottom  = min(y + height, rectangle.y + rectangle.height)
        
        guard (left > right || top > bottom) == false else { return nil }
        
        return Rectangle(x: left, y: top, width: right - left, height: bottom - top)
    }
    
    public func unite(rectangle: Rectangle) -> Rectangle {
        
        let left    = min(x, rectangle.x)
        let right   = max(x + width, rectangle.x + rectangle.width)
        let top     = min(y, rectangle.y)
        let bottom  = max(y + height, rectangle.y + rectangle.height)
        
        return Rectangle(x: left, y: top, width: right - left, height: bottom - top)
    }
    
    public func boundsAfterTransformation(matrix: Matrix) -> Rectangle {
        
        for i in 0 ..< 4 {
            
            let point = 
        }
    }
}

// MARK: - Darwin Support

#if os(iOS) || tvOS
    
    extension Rectangle: UIKitConvertible {
        
        public init(_ rect: CGRect) {
            
            self.init(x: Float(rect.origin.x),
                y: Float(rect.origin.y),
                width: Float(rect.size.width),
                height: Float(rect.size.height))
        }
        
        public func toUIKit() -> CGRect {
            
            return CGRectMake(CGFloat(x), CGFloat(y), CGFloat(width), CGFloat(height))
        }
    }
    
#endif