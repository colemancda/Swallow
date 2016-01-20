//
//  Matrix.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Describes an affine, 2D transformation Matrix. 
/// It provides methods to manipulate the matrix in convenient ways, and can be used to transform points.
public struct Matrix {
    
    // MARK: - Properties
    
    public var a: Float
    
    public var b: Float
    
    public var c: Float
    
    public var d: Float
    
    public var translation: (x: Float, y: Float)
    
    // MARK: - Initialization
    
    public static let identity = Matrix()
    
    public init(a: Float = 1, b: Float = 0, c: Float = 0, d: Float = 1, translation: (x: Float, y: Float) = (0, 0)) {
        
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.translation = translation
    }
    
    public init(rotation angle: Float) {
        
        self.init(a: cosf(angle), b: sinf(angle), c: -sinf(angle), d: cosf(angle), translation: (0, 0))
    }
    
    public init(scale: (x: Float, y: Float)) {
        
        self.init(a: scale.x, b: 0, c: 0, d: scale.y, translation: (0, 0))
    }
    
    // MARK: - Methods
    
    func tranform(point: Point) -> Point {
        
        return Point(x: a * point.x + c * point.y + translation.x, y: b * point.x + d * point.y + translation.y)
    }
}