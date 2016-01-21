//
//  Matrix4.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/20/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/** A 4x4 matrix.

- Note: m30, m31, and m32 correspond to the translation values tx, ty, and tz, respectively.
m[12], m[13], and m[14] correspond to the translation values tx, ty, and tz, respectively.
*/
public struct Matrix4 {
    
    // MARK: - Value
    
    public var value: (Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float)
    
    // MARK: - Initialization
    
    public init(_ m0: (Float, Float, Float, Float),
                _ m1: (Float, Float, Float, Float),
                _ m2: (Float, Float, Float, Float),
                _ m3: (Float, Float, Float, Float))
    {
        self.value = (m0.0, m0.1, m0.2, m0.3,
                      m1.0, m1.1, m1.2, m1.3,
                      m2.0, m2.1, m2.2, m2.3,
                      m3.0, m3.1, m3.2, m3.3)
    }
    
    public static let Identity = Matrix4((0,0,0,0), (0,0,0,0), (0,0,0,0), (0,0,0,0))
    
    // MARK: - Accessors
    
    public var m00: Float {
        
        get { return value.0 }
        set { value.0 = newValue }
    }
    
    public var m01: Float {
        
        get { return value.1 }
        set { value.1 = newValue }
    }
    
    public var m02: Float {
        
        get { return value.2 }
        set { value.2 = newValue }
    }
    
    public var m03: Float {
        
        get { return value.3 }
        set { value.3 = newValue }
    }
    
    public var m10: Float {
        
        get { return value.4 }
        set { value.4 = newValue }
    }
    
    public var m11: Float {
        
        get { return value.5 }
        set { value.5 = newValue }
    }
    
    public var m12: Float {
        
        get { return value.6 }
        set { value.6 = newValue }
    }
    
    public var m13: Float {
        
        get { return value.7 }
        set { value.7 = newValue }
    }
    
    public var m20: Float {
        
        get { return value.8 }
        set { value.8 = newValue }
    }
    
    public var m21: Float {
        
        get { return value.9 }
        set { value.9 = newValue }
    }
    
    public var m22: Float {
        
        get { return value.10 }
        set { value.10 = newValue }
    }
    
    public var m23: Float {
        
        get { return value.11 }
        set { value.11 = newValue }
    }
    
    public var m30: Float {
        
        get { return value.12 }
        set { value.12 = newValue }
    }
    
    public var m31: Float {
        
        get { return value.13 }
        set { value.13 = newValue }
    }
    
    public var m32: Float {
        
        get { return value.14 }
        set { value.14 = newValue }
    }
    
    public var m33: Float {
        
        get { return value.15 }
        set { value.15 = newValue }
    }
    
    // MARK: - Subscripting
    
    public subscript (index: Int) -> Float {
        
        get {
            
            switch index {
                
            case  0: return value.0
            case  1: return value.1
            case  2: return value.2
            case  3: return value.3
            case  4: return value.4
            case  5: return value.5
            case  6: return value.6
            case  7: return value.7
            case  8: return value.8
            case  9: return value.9
            case 10: return value.10
            case 11: return value.11
            case 12: return value.12
            case 13: return value.13
            case 14: return value.14
            case 15: return value.15
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        set {
            
            switch index {
                
            case  0: value.0  = newValue
            case  1: value.1  = newValue
            case  2: value.2  = newValue
            case  3: value.3  = newValue
            case  4: value.4  = newValue
            case  5: value.5  = newValue
            case  6: value.6  = newValue
            case  7: value.7  = newValue
            case  8: value.8  = newValue
            case  9: value.9  = newValue
            case 10: value.10 = newValue
            case 11: value.11 = newValue
            case 12: value.12 = newValue
            case 13: value.13 = newValue
            case 14: value.14 = newValue
            case 15: value.15 = newValue
                
            default: fatalError("Invalid index \(index)")
            }
        }
    }
}

// MARK: - Math

public extension Matrix4 {
    
    public mutating func multiply(lhs: Matrix4) {
        
        var m = Matrix4.Identity
        
        m.value.0  = lhs.value.0 * value.0  + lhs.value.4 * value.1  + lhs.value.8 * value.2   + lhs.value.12 * value.3;
        m.value.4  = lhs.value.0 * value.4  + lhs.value.4 * value.5  + lhs.value.8 * value.6   + lhs.value.12 * value.7;
        m.value.8  = lhs.value.0 * value.8  + lhs.value.4 * value.9  + lhs.value.8 * value.10  + lhs.value.12 * value.11;
        m.value.12 = lhs.value.0 * value.12 + lhs.value.4 * value.13 + lhs.value.8 * value.14  + lhs.value.12 * value.15;
        
        m.value.1  = lhs.value.1 * value.0  + lhs.value.5 * value.1  + lhs.value.9 * value.2   + lhs.value.13 * value.3;
        m.value.5  = lhs.value.1 * value.4  + lhs.value.5 * value.5  + lhs.value.9 * value.6   + lhs.value.13 * value.7;
        m.value.9  = lhs.value.1 * value.8  + lhs.value.5 * value.9  + lhs.value.9 * value.10  + lhs.value.13 * value.11;
        m.value.13 = lhs.value.1 * value.12 + lhs.value.5 * value.13 + lhs.value.9 * value.14  + lhs.value.13 * value.15;
        
        m.value.2  = lhs.value.2 * value.0  + lhs.value.6 * value.1  + lhs.value.10 * value.2  + lhs.value.14 * value.3;
        m.value.6  = lhs.value.2 * value.4  + lhs.value.6 * value.5  + lhs.value.10 * value.6  + lhs.value.14 * value.7;
        m.value.10 = lhs.value.2 * value.8  + lhs.value.6 * value.9  + lhs.value.10 * value.10 + lhs.value.14 * value.11;
        m.value.14 = lhs.value.2 * value.12 + lhs.value.6 * value.13 + lhs.value.10 * value.14 + lhs.value.14 * value.15;
        
        m.value.3  = lhs.value.3 * value.0  + lhs.value.7 * value.1  + lhs.value.11 * value.2  + lhs.value.15 * value.3;
        m.value.7  = lhs.value.3 * value.4  + lhs.value.7 * value.5  + lhs.value.11 * value.6  + lhs.value.15 * value.7;
        m.value.11 = lhs.value.3 * value.8  + lhs.value.7 * value.9  + lhs.value.11 * value.10 + lhs.value.15 * value.11;
        m.value.15 = lhs.value.3 * value.12 + lhs.value.7 * value.13 + lhs.value.11 * value.14 + lhs.value.15 * value.15;
        
        self = m
    }
}

// MARK: - Darwin Support

#if os(iOS) || os(tvOS)
    
    import GLKit
    
    extension Matrix4: UIKitConvertible {
        
        public init(_ GLKitValue: GLKMatrix4) {
            
            self.value = GLKitValue.m
        }
        
        public func toUIKit() -> GLKMatrix4 {
            
            return GLKMatrix4(m: self.value)
        }
    }
    
#endif

