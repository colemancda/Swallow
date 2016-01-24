//
//  Rectangle.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Kronos

#if os(iOS) || os(tvOS)
    import Darwin.C
#elseif os(Linux)
    import GLibc
#endif

/// Describes a rectangle by its top-left corner point (x, y) and by its width and height.
public struct Rectangle: Equatable, Hashable {
    
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
        
        var minX = FLT_MAX
        var minY = FLT_MAX
        var maxX = FLT_MIN
        var maxY = FLT_MIN
        
        for i in 0 ..< 4 {
            
            let transformedPoint = matrix.transform(Point(x: width * positions[i].x, y: height * positions[i].y))
            
            if (minX > transformedPoint.x) { minX = transformedPoint.x }
            if (maxX < transformedPoint.x) { maxX = transformedPoint.x }
            if (minY > transformedPoint.y) { minY = transformedPoint.y }
            if (maxY < transformedPoint.y) { maxY = transformedPoint.y }
        }
        
        return Rectangle(x: minX, y: minY, width: maxX - minX, height:  maxY - minY)
    }
    
    public func inflate(dx: Float, dy: Float) -> Rectangle {
        
        var rect = self
        
        rect.x -= dx
        rect.width += 2 * dx
        
        rect.y -= dy
        rect.height += 2 * dy
        
        return rect
    }
    
    public func fit(into: Rectangle, scaleMode: ScaleMode = .None, pixelPerfect: Bool) -> Rectangle {
        
        let factorX = into.width / self.width
        let factorY = into.width / self.height
        var factor  = Float(1.0)
        
        switch scaleMode {
            
        case .None: break
            
        case .ShowAll:
            
            factor = factorX < factorY ? factorX : factorY
            if pixelPerfect { factor = nextSuitableScaleFactor(factor, up: false) }
            
        case .NoBorder:
            
            factor = factorX > factorY ? factorX : factorY
            if (pixelPerfect) { factor = nextSuitableScaleFactor(factor, up: true) }
        }
        
        let width = self.width * factor
        let height = self.height * factor
        
        return Rectangle(x: into.x + (into.width - width) / 2, y: into.y + (into.height - height) / 2, width: width, height: height)
    }
    
    public func scale(scale: Float) -> Rectangle {
        
        var rect = self
        
        rect.x *= scale
        rect.y *= scale
        rect.width *= scale
        rect.height *= scale
        
        return rect
    }
    
    public func scaleSize(scale: Float) -> Rectangle {
        
        var rect = self
        
        rect.width *= scale
        rect.height *= scale
        
        return rect
    }
    
    public mutating func setEmpty() {
        
        self = Rectangle()
    }
    
    public func normalize() -> Rectangle {
        
        var rect = self
        
        if (rect.width < 0.0)
        {
            rect.width = -rect.width
            rect.x -= rect.width
        }
        
        if (rect.height < 0.0)
        {
            rect.height = -rect.height
            rect.y -= rect.height
        }
        
        return rect
    }
}

// MARK: - Equatable

public func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
    
    return lhs.x == rhs.x
        && lhs.y == rhs.y
        && lhs.width == rhs.width
        && lhs.height  == rhs.height
}

// MARK: - AlmostEquatable

extension Rectangle: AlmostEquatable {
    
    public func almostEqual(rhs: Rectangle, tolerance: Float = FloatEpsilon) -> Bool {
        
        return self.x.almostEqual(rhs.x)
            && self.y.almostEqual(rhs.y)
            && self.width.almostEqual(rhs.width)
            && self.height.almostEqual(rhs.height)
    }
}

// MARK: - Hashable

public extension Rectangle {
    
    public var hashValue: Int {
        
        return x.hashValue
            ^ y.hashValue.shiftAndRotate(1)
            ^ width.hashValue.shiftAndRotate(1)
            ^ height.hashValue.shiftAndRotate(1)
    }
}

// MARK: - Accessors

public extension Rectangle {
    
    var isEmpty: Bool {
        
        return width == 0 || height == 0
    }
    
    var top: Float {
        
        get { return y }
        set { y = newValue }
    }
    
    var bottom: Float {
        
        get { return y + height }
        set { height = newValue - y }
    }
    
    var left: Float {
        
        get { return x }
        set { x = newValue }
    }
    
    var right: Float {
        
        get { return x + width }
        set { width = newValue - x }
    }
    
    var size: (Float, Float) {
        
        get { return (width, height) }
        set { width = newValue.0; height = newValue.1 }
    }
}

// MARK: - Private

private let positions = [
    Vector2(0, 0),
    Vector2(1, 0),
    Vector2(0, 1),
    Vector2(1, 1)
]

/// Calculates the next whole-number multiplier or divisor, moving either up or down.
private func nextSuitableScaleFactor(factor: Float, up: Bool) -> Float {
    
    var divisor: Float = 1.0
    
    if (up)
    {
        if (factor >= 0.5) { return ceilf(factor) }
        else
        {
            while (1.0 / (divisor + 1.0) > factor) { ++divisor }
        }
    }
    else
    {
        if (factor >= 1.0) { return floorf(factor) }
        else
        {
            while (1.0 / divisor > factor) { ++divisor }
        }
    }
    
    return 1.0 / divisor
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